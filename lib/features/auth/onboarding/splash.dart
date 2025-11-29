import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mostawak/core/constants/app_assets.dart';
import 'package:mostawak/core/constants/app_colors.dart';
import 'package:mostawak/data/preferences/preference_manager.dart';
import 'package:mostawak/features/auth/login/screens/login_screen.dart';
import 'package:mostawak/features/home/home/screens/main_screen.dart';
import 'onboarding.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  PreferenceManager().getBool("isFirstLaunch") ?? true
                      ? const OnboardingScreen()
                      : FirebaseAuth.instance.currentUser != null
                          ? const MainScreen()
                          : const LoginScreen()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.primary,
      body: Center(
        child: SvgPicture.asset(
          AppAssets.svgLogo,
          width: 162.w,
          height: 85.h,
        ),
      ),
    );
  }
}
