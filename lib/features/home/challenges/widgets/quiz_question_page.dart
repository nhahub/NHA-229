import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
        child: Container(
          padding: EdgeInsets.all(20.h),
          decoration: BoxDecoration(
            color: const Color(0xFFD9D9D9),
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                question,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24.sp, // responsive
                  fontFamily: "BigShoulders",
                  color: MyColors.primary,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 20.h),
              Column(
                children: List.generate(answers.length, (i) {
                  bool isSelected = selectedIndex == i;
                  return Padding(
                    padding: EdgeInsets.only(bottom: 10.h),
                    child: GestureDetector(
                      onTap: () => onAnswerSelected(i),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: isSelected
                              ? MyColors.primary
                              : const Color(0xFFECE7E3),
                          borderRadius: BorderRadius.circular(10.r),
                          border: Border.all(
                            color: isSelected
                                ? Colors.transparent
                                : Colors.grey.shade400,
                          ),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 14.h),
                        alignment: Alignment.center,
                        child: Text(
                          answers[i],
                          style: TextStyle(
                            color: isSelected ? Colors.white : Colors.black54,
                            fontSize: 18.sp, // responsive
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
      ),
    );
  }
}
