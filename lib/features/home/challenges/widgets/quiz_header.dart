import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';

class QuizHeader extends StatelessWidget {
  final int currentIndex;
  final int totalQuestions;
  final List<int?> selectedAnswers;

  const QuizHeader({
    Key? key,
    required this.currentIndex,
    required this.totalQuestions,
    required this.selectedAnswers,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Wrap(
        alignment: WrapAlignment.center,
        spacing: 10,
        runSpacing: 10,
        children: List.generate(totalQuestions, (index) {
          final bool isCurrent = index == currentIndex;
          final bool isAnswered = selectedAnswers[index] != null;

          // Background color
          final Color bgColor = (isCurrent || isAnswered)
              ? MyColors.primary
              : const Color(0xFFD9D9D9);

          // Text color
          final Color textColor = (isCurrent || isAnswered)
              ? Colors.white
              : Colors.black;

          return Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.circular(6),
            ),
            child: Center(
              child: Text(
                '${index + 1}',
                style: TextStyle(
                  color: textColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  fontFamily: "BigShoulders",
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}