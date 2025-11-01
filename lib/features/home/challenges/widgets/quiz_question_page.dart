import 'package:flutter/material.dart';
import 'package:mostawak/core/constants/app_colors.dart';

class QuizQuestionPage extends StatelessWidget {
  final String question;
  final List<dynamic> answers;
  final int? selectedIndex;
  final Function(int) onAnswerSelected;

  const QuizQuestionPage({
    super.key,
    required this.question,
    required this.answers,
    required this.selectedIndex,
    required this.onAnswerSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: const Color(0xFFD9D9D9),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              question,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 32,
                fontFamily: "BigShoulders",
                color: MyColors.primary,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 20),
            Column(
              children: List.generate(answers.length, (i) {
                bool isSelected = selectedIndex == i;
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: GestureDetector(
                    onTap: () => onAnswerSelected(i),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: isSelected
                            ? MyColors.primary
                            : const Color(0xFFECE7E3),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: isSelected
                              ? Colors.transparent
                              : Colors.grey.shade400,
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      alignment: Alignment.center,
                      child: Text(
                        answers[i],
                        style: TextStyle(
                          color: isSelected ? Colors.white : Colors.black54,
                          fontSize: 25,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
