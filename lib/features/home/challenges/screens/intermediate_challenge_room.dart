import 'package:flutter/material.dart';
import '../../../../data/level_inter_quiz1.dart';
import '../widgets/quiz_header.dart';
import '../widgets/quiz_navigation.dart';
import '../widgets/quiz_question_page.dart';
import '../widgets/reusable_appbar.dart';
import 'challenge_room_result.dart';

class IntermediateChallengeRoomScreen extends StatefulWidget {
  const IntermediateChallengeRoomScreen({super.key});

  @override
  State<IntermediateChallengeRoomScreen> createState() =>
      _IntermediateChallengeRoomScreenState();
}

class _IntermediateChallengeRoomScreenState
    extends State<IntermediateChallengeRoomScreen> {
  late final PageController _pageController;
  late List<int?> _selectedAnswers;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _selectedAnswers = List.filled(grammarTenseQuizQuestions.length, null);
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
            content: Text("Please select an answer before proceeding.")),
      );
      return;
    }

    if (_currentIndex < grammarTenseQuizQuestions.length - 1) {
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

  void _finishQuiz() {
    int score = 0;

    for (int i = 0; i < grammarTenseQuizQuestions.length; i++) {
      final correctAnswer = grammarTenseQuizQuestions[i]['correct'];
      if (_selectedAnswers[i] == correctAnswer) score++;
    }

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => ChallengeRoomResultResultScreen(
          score: score,
          totalQuestions: grammarTenseQuizQuestions.length,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (grammarTenseQuizQuestions.isEmpty) {
      return const Scaffold(
        body: Center(child: Text("No questions available.")),
      );
    }

    return Scaffold(
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
            totalQuestions: grammarTenseQuizQuestions.length,
            selectedAnswers: _selectedAnswers,
          ),
          const SizedBox(height: 24),
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: grammarTenseQuizQuestions.length,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => QuizQuestionPage(
                question: grammarTenseQuizQuestions[index]['question'],
                answers: grammarTenseQuizQuestions[index]['answers'],
                selectedIndex: _selectedAnswers[index],
                onAnswerSelected: (i) => _selectAnswer(i),
              ),
            ),
          ),
          QuizNavigation(
            currentIndex: _currentIndex,
            totalQuestions: grammarTenseQuizQuestions.length,
            onNext: _nextQuestion,
            onPrev: _prevQuestion,
          ),
        ],
      ),
    );
  }
}
