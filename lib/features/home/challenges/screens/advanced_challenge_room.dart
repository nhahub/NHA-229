import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../../../data/level_advanced_data.dart';
import '../../../../data/services/quiz_services.dart';
import '../widgets/quiz_header.dart';
import '../widgets/quiz_navigation.dart';
import '../widgets/quiz_question_page.dart';
import '../widgets/reusable_appbar.dart';
import 'challenge_room_result.dart';

class AdvancedChallengeRoomScreen extends StatefulWidget {
  const AdvancedChallengeRoomScreen({super.key});

  @override
  State<AdvancedChallengeRoomScreen> createState() =>
      _AdvancedChallengeRoomScreenState();
}

class _AdvancedChallengeRoomScreenState
    extends State<AdvancedChallengeRoomScreen> {
  late final PageController _pageController;
  late List<int?> _selectedAnswers;
  int _currentIndex = 0;
  bool _isSubmitting = false;
  String? uid;
  String? userName;
  final QuizService _quizService = QuizService();

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _selectedAnswers = List.filled(advancedReadingQuizQuestions.length, null);

    // Get user info safely
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser == null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('User not logged in!')),
        );
        Navigator.pop(context);
      });
    } else {
      uid = currentUser.uid;
      userName = currentUser.displayName ?? 'Anonymous';
    }
  }

  void _selectAnswer(int answerIndex) {
    setState(() {
      _selectedAnswers[_currentIndex] = answerIndex;
    });
  }

  void _nextQuestion() {
    if (_selectedAnswers[_currentIndex] == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please select an answer before proceeding."),
        ),
      );
      return;
    }

    if (_currentIndex < advancedReadingQuizQuestions.length - 1) {
      setState(() => _currentIndex++);
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      _finishQuiz();
    }
  }

  void _prevQuestion() {
    if (_currentIndex > 0) {
      setState(() => _currentIndex--);
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  Future<void> _finishQuiz() async {
    if (uid == null || userName == null) return;

    int score = 0;
    for (int i = 0; i < advancedReadingQuizQuestions.length; i++) {
      if (_selectedAnswers[i] == advancedReadingQuizQuestions[i]['correct']) score++;
    }

    setState(() => _isSubmitting = true);

    try {
      await _quizService.finishQuiz(
        uid: uid!,
        quizId: "advancedChallenge1",
        userName: userName!,
        score: score,
      );

      if (!mounted) return;

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => ChallengeRoomResultResultScreen(
            score: score,
            totalQuestions: advancedReadingQuizQuestions.length,
          ),
        ),
      );
    } catch (e) {
      if (mounted) {
        setState(() => _isSubmitting = false);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Error finishing quiz: $e")),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (advancedReadingQuizQuestions.isEmpty) {
      return const Scaffold(
        body: Center(child: Text("No questions available.")),
      );
    }

    return Stack(
      children: [
        Scaffold(
          backgroundColor: const Color(0xFFF9F6F2),
          appBar: const ReusableAppBar(
            centerImage: 'assets/images/challenge ROOM.svg',
            showTabs: false,
          ),
          body: Column(
            children: [
              const SizedBox(height: 16),
              QuizHeader(
                currentIndex: _currentIndex,
                totalQuestions: advancedReadingQuizQuestions.length,
                selectedAnswers: _selectedAnswers,
              ),
              const SizedBox(height: 24),
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: advancedReadingQuizQuestions.length,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => QuizQuestionPage(
                    question: advancedReadingQuizQuestions[index]['question'],
                    answers: advancedReadingQuizQuestions[index]['answers'],
                    selectedIndex: _selectedAnswers[index],
                    onAnswerSelected: _selectAnswer,
                  ),
                ),
              ),
              QuizNavigation(
                currentIndex: _currentIndex,
                totalQuestions: advancedReadingQuizQuestions.length,
                onNext: _nextQuestion,
                onPrev: _prevQuestion,
              ),
            ],
          ),
        ),
        if (_isSubmitting)
          Positioned.fill(
            child: Container(
              color: Colors.black.withOpacity(0.5),
              child: const Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
