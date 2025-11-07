import 'package:flutter/material.dart';

class QuizNavigation extends StatelessWidget {
  final int currentIndex;
  final int totalQuestions;
  final VoidCallback onNext;
  final VoidCallback onPrev;

  const QuizNavigation({
    super.key,
    required this.currentIndex,
    required this.totalQuestions,
    required this.onNext,
    required this.onPrev,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CircleAvatar(
            radius: 20,
            backgroundColor: currentIndex > 0
                ? const Color(0xFFFF9E1B)
                : Colors.grey.shade400,
            child: IconButton(
              icon: const Icon(
                Icons.keyboard_double_arrow_left_rounded,
                color: Colors.white,
              ),
              onPressed: currentIndex > 0 ? onPrev : null,
            ),
          ),
          CircleAvatar(
            radius: 20,
            backgroundColor: const Color(0xFFFF9E1B),
            child: IconButton(
              icon: const Icon(Icons.keyboard_double_arrow_right_rounded,
                  color: Colors.white),
              onPressed: onNext,
            ),
          ),
        ],
      ),
    );
  }
}
