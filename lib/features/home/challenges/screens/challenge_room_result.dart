import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../auth/login/widgets/or_divider.dart';

class ChallengeRoomResultResultScreen extends StatelessWidget {
  final int score;
  final int totalQuestions;

  const ChallengeRoomResultResultScreen({
    super.key,
    required this.score,
    required this.totalQuestions,
  });

  @override
  Widget build(BuildContext context) {
    bool passed = score >= (totalQuestions / 2);

    // Colors and texts depending on result
    String title = passed ? "CONGRATULATIONS" : "KEEP TRYING";
    Color titleColor = passed ? MyColors.primary : MyColors.primary;
    Color scoreColor = passed ? MyColors.primary : Colors.red.shade800;

    String message = passed
        ? "Great job! You did it!"
        : "Keep trying – failure is just a step toward success";

    return Scaffold(
      backgroundColor: const Color(0xFFF9F6F2),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              const SizedBox(height: 120),
              Text(
                title,
                style: TextStyle(
                  fontSize: 40,
                  fontFamily: "BigShoulders",
                  fontWeight: FontWeight.bold,
                  color: titleColor,
                  letterSpacing: 1.2,
                ),
              ),
              const SizedBox(height: 40),
              Text(
                "Your Score",
                style: TextStyle(
                  fontSize: 40,
                  fontFamily: "BigShoulders",
                  color: scoreColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 20),
              Container(
                width: 140,
                height: 140,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: scoreColor, width: 3),
                ),
                alignment: Alignment.center,
                child: Text(
                  "$score/$totalQuestions",
                  style: TextStyle(
                    fontSize: 50,
                    fontFamily: "BigShoulders",
                    fontWeight: FontWeight.bold,
                    color: scoreColor,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                message,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              const Spacer(), // pushes buttons to bottom
              Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // TODO: share or restart logic
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: MyColors.primary,
                      minimumSize: const Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      passed ? "Share" : "Try Again",
                      style: const TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const OrDivider(),
                  const SizedBox(height: 10),
                  OutlinedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: OutlinedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 50),
                      side: const BorderSide(color: MyColors.primary, width: 2),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      "Continue",
                      style: TextStyle(
                        fontSize: 18,
                        color: MyColors.primary,
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
