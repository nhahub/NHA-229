import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mostawak/core/constants/app_assets.dart';
import 'package:mostawak/data/preferences/preference_manager.dart';
import 'package:mostawak/generated/l10n.dart';
import '../signup/signup_screen.dart';
import '../login/widgets/custom_button.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, dynamic>> _onboardingPages = [
    {
      "image": AppAssets.onboarding1,
      "isSvg": true,
      "title": S.current.welcome,
      "titleHighlight": " Mostawak",
      "description": S.current.welcomeMessage,
    },
    {
      "image": AppAssets.onboarding2,
      "isSvg": true,
      "title": S.current.challengeYourFriends,
      "titleHighlight": "",
      "description": S.current.challengeYourFriendsMessage,
    },
    {
      "image": AppAssets.onboarding3,
      "isSvg": true,
      "title": S.current.learnWithFun,
      "titleHighlight": "",
      "description": S.current.learnWithFunMessage,
    },
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: _onboardingPages.length,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                itemBuilder: (context, index) {
                  final page = _onboardingPages[index];

                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          height: 500.h,
                          width: double.infinity,
                          decoration: const BoxDecoration(
                            color: Color(0xff16697B),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(150),
                              bottomRight: Radius.circular(150),
                            ),
                          ),
                          child: Center(
                            child: page["isSvg"]
                                ? SvgPicture.asset(
                                    page["image"],
                                    width: 300,
                                    height: 300,
                                    fit: BoxFit.fill,
                                  )
                                : Image.asset(
                                    page["image"],
                                    width: 300,
                                    height: 300,
                                    fit: BoxFit.contain,
                                  ),
                          ),
                        ),

                        const SizedBox(height: 20),

                        // Title
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: page["titleHighlight"].isNotEmpty
                              ? RichText(
                                  textAlign: TextAlign.center,
                                  text: TextSpan(
                                    style: const TextStyle(
                                      fontSize: 35,
                                      fontWeight: FontWeight.w700,
                                      fontFamily: "BigShoulders",
                                      color: Color(0XFF82C0CB),
                                    ),
                                    children: [
                                      TextSpan(text: page["title"]),
                                      TextSpan(
                                        text: page["titleHighlight"],
                                        style: const TextStyle(
                                          color: Color(0XFF16697B),
                                        ),
                                      ),
                                      const TextSpan(text: ' !'),
                                    ],
                                  ),
                                )
                              : Text(
                                  page["title"],
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: 35,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: "BigShoulders",
                                    color: Color(0XFF82C0CB),
                                  ),
                                ),
                        ),

                        const SizedBox(height: 15),

                        // Description
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: Text(
                            page["description"],
                            textAlign: TextAlign.start,
                            style: const TextStyle(
                              fontSize: 22,
                              color: Color(0XFF82C0CB),
                              fontFamily: "Almarai",
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            if (_currentPage == _onboardingPages.length - 1) ...[
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: CustomButton(
                  text: S.current.getStarted,
                  onPressed: () async {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SignupScreen(),
                      ),
                    );
                    await PreferenceManager().setBool("isFirstLaunch", false);
                  },
                ),
              ),
            ],
            if (_currentPage != _onboardingPages.length - 1)
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0XFF16697B),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        minimumSize: const Size(60, 30),
                      ),
                      onPressed: () async {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignupScreen(),
                          ),
                        );
                        await PreferenceManager()
                            .setBool("isFirstLaunch", false);
                      },
                      child: Text(
                        S.current.skip,
                        style: const TextStyle(
                          color: Color(0XFFECE7E3),
                          fontFamily: "BigShoulders",
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    // Next Button
                    GestureDetector(
                      onTap: () {
                        _pageController.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeInOut,
                        );
                      },
                      child: Container(
                        width: 60,
                        height: 40,
                        decoration: const BoxDecoration(
                          color: Color(0xffFFA62B),
                          shape: BoxShape.circle,
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
