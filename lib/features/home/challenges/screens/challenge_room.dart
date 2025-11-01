import 'package:flutter/material.dart';
import '../../../../data/level_beginner1_quiz.dart';
import '../widgets/quiz_header.dart';
import '../widgets/quiz_navigation.dart';
import '../widgets/quiz_question_page.dart';
import 'challenge_room_result.dart';

class ChallengeRoomScreen extends StatefulWidget {
  const ChallengeRoomScreen({Key? key}) : super(key: key);

  @override
  State<ChallengeRoomScreen> createState() => _ChallengeRoomScreenState();
}

class _ChallengeRoomScreenState extends State<ChallengeRoomScreen> {
  late final PageController _pageController;
  late List<int?> _selectedAnswers;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _selectedAnswers = List.filled(quizQuestions.length, null);
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

    if (_currentIndex < quizQuestions.length - 1) {
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

    for (int i = 0; i < quizQuestions.length; i++) {
      final correctAnswer = quizQuestions[i]['correct'];
      if (_selectedAnswers[i] == correctAnswer) score++;
    }

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => ChallengeRoomResultResultScreen(
          score: score,
          totalQuestions: quizQuestions.length,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (quizQuestions.isEmpty) {
      return const Scaffold(
        body: Center(child: Text("No questions available.")),
      );
    }

    return Scaffold(
      backgroundColor: const Color(0xFFF9F6F2),
      appBar: AppBar(
        backgroundColor: const Color(0xFF206E79),
        elevation: 0,
        title: const Text.rich(
          TextSpan(children: [
            TextSpan(
              text: "CHALLENGE ",
              style:
                  TextStyle(color: Colors.white70, fontWeight: FontWeight.bold),
            ),
            TextSpan(
              text: "ROOM",
              style: TextStyle(
                  color: Color(0xFFFF9E1B), fontWeight: FontWeight.bold),
            ),
          ]),
        ),
        centerTitle: true,
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
              itemBuilder: (context, index) => QuizQuestionPage(
                question: quizQuestions[index]['question'],
                answers: quizQuestions[index]['answers'],
                selectedIndex: _selectedAnswers[index],
                onAnswerSelected: (i) => _selectAnswer(i),
              ),
            ),
          ),
          QuizNavigation(
            currentIndex: _currentIndex,
            totalQuestions: quizQuestions.length,
            onNext: _nextQuestion,
            onPrev: _prevQuestion,
          ),
        ],
      ),
    );
  }
}
