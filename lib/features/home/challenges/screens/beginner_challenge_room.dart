import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../../../data/level_beginner_quiz1.dart';
import '../../../../data/services/quiz_services.dart';
import '../widgets/quiz_header.dart';
import '../widgets/quiz_navigation.dart';
import '../widgets/quiz_question_page.dart';
import '../widgets/reusable_appbar.dart';
import 'challenge_room_result.dart';

class BeginnerChallengeRoomScreen extends StatefulWidget {
  const BeginnerChallengeRoomScreen({super.key});

  @override
  State<BeginnerChallengeRoomScreen> createState() =>
      _BeginnerChallengeRoomScreenState();
}

class _BeginnerChallengeRoomScreenState
    extends State<BeginnerChallengeRoomScreen> {
  late final PageController _pageController;
  late List<int?> _selectedAnswers;
  final QuizService _quizService = QuizService();
  final int _currentIndex = 0;

  final String quizId = "beginnerChallenge1";
  String? uid;
  bool _loading = true;
  bool _isSubmitting = false;
  String? userName;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _selectedAnswers = List.filled(quizQuestions.length, null);

    // Get UID and username safely
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
      userName = currentUser.displayName ?? 'User';
      setState(() => _loading = false);
    }
  }

  void _finishQuiz() async {
    if (uid == null || userName == null) return;

    int score = 0;
    for (int i = 0; i < quizQuestions.length; i++) {
      if (_selectedAnswers[i] == quizQuestions[i]['correct']) score++;
    }

    setState(() => _isSubmitting = true);

    try {
      await _quizService.finishQuiz(
        uid: uid!,
        quizId: quizId,
        userName: userName!,
        score: score,
      );

      if (!mounted) return;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => ChallengeRoomResultResultScreen(
            score: score,
            totalQuestions: quizQuestions.length,
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
    if (_loading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
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
                totalQuestions: quizQuestions.length,
                selectedAnswers: _selectedAnswers,
              ),
              const SizedBox(height: 24),
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: quizQuestions.length,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (_, index) => QuizQuestionPage(
                    question: quizQuestions[index]['question'],
                    answers: quizQuestions[index]['answers'],
                    selectedIndex: _selectedAnswers[index],
                    onAnswerSelected: (i) {
                      setState(() => _selectedAnswers[index] = i);
                    },
                  ),
                ),
              ),
              QuizNavigation(
                currentIndex: _currentIndex,
                totalQuestions: quizQuestions.length,
                onNext: () {
                  final nextPage = _pageController.page!.toInt() + 1;
                  if (nextPage < quizQuestions.length) {
                    _pageController.animateToPage(
                      nextPage,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  } else {
                    _finishQuiz();
                  }
                },
                onPrev: () {
                  final prevPage = _pageController.page!.toInt() - 1;
                  if (prevPage >= 0) {
                    _pageController.animateToPage(
                      prevPage,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  }
                },
              ),
            ],
          ),
        ),
        if (_isSubmitting)
          Positioned.fill(
            child: Container(
              color: Colors.black.withValues(alpha: 0.5),
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
