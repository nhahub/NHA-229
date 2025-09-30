import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../login/screens/signup_screen.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                "assets/onboarding3.svg",
                width: 400,
                height: 500,
              ),
              const SizedBox(height: 15),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Learn with Fun",
                    style: TextStyle(
                      color: Color(0xFF82C0CB),
                      fontSize: 40,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              //SizedBox(height: 10),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Enjoy a different\neducational journey, full \nof interaction and fun.",
                    style: TextStyle(
                      color: Color(0xFF82C0CB),
                      fontSize: 32,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignupScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF16697B),
                  foregroundColor: const Color(0xFFECE7E3),
                  minimumSize: const Size(200, 50),
                ),
                child: const Text(
                  " Get Started",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.w400),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
