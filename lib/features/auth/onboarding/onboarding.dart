import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../login/screens/signup_screen.dart';

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
      "image": "assets/images/mostawakLogo.png",
      "isSvg": false,
      "title": "Welcome to ",
      "titleHighlight": "Mostawak !",
      "description": "Your place to learn and develop in simple and easy steps",
    },
    {
      "image": "assets/images/login.png",
      "isSvg": false,
      "title": "Challenge Your Friends !",
      "titleHighlight": "",
      "description":
          "Compete with your friend your knowledge, and make learning more exciting.",
    },
    {
      "image": "assets/images/onboarding3.svg",
      "isSvg": true,
      "title": "Learn with Fun",
      "titleHighlight": "",
      "description":
          "Enjoy a different educational journey, full of interaction and fun.",
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
                  final isLastPage = index == _onboardingPages.length - 1;

                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        // Image Container
                        Container(
                          height: 400,
                          width: double.infinity,
                          decoration: const BoxDecoration(
                            color: Color(0xff16697B),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(150),
                              bottomRight: Radius.circular(150),
                            ),
                          ),
                          child: Center(
                            child:
                                page["isSvg"]
                                    ? SvgPicture.asset(
                                      page["image"],
                                      width: 300,
                                      height: 300,
                                      fit: BoxFit.contain,
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
                          child:
                              page["titleHighlight"].isNotEmpty
                                  ? RichText(
                                    textAlign: TextAlign.center,
                                    text: TextSpan(
                                      style: const TextStyle(
                                        fontSize: 35,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: "Bebas Neue",
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
                                      ],
                                    ),
                                  )
                                  : Text(
                                    page["title"],
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      fontSize: 35,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: "Bebas Neue",
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
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 25,
                              color: Color(0XFF82C0CB),
                              fontFamily: "Almarai",
                            ),
                          ),
                        ),

                        // Show "Get Started" button only on last page
                        if (isLastPage) ...[
                          const SizedBox(height: 30),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SignupScreen(),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF16697B),
                              foregroundColor: const Color(0xFFECE7E3),
                              minimumSize: const Size(200, 50),
                            ),
                            child: const Text(
                              "Get Started",
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.w400,
                                fontFamily: "Bebas Neue",
                              ),
                            ),
                          ),
                        ],
                      ],
                    ),
                  );
                },
              ),
            ),

            // Bottom Navigation (Skip & Next) - Hide on last page
            if (_currentPage != _onboardingPages.length - 1)
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Skip Button
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0XFF16697B),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        minimumSize: const Size(100, 50),
                      ),
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignupScreen(),
                          ),
                        );
                      },
                      child: const Text(
                        "Skip",
                        style: TextStyle(
                          color: Color(0XFFECE7E3),
                          fontFamily: "Bebas Neue",
                          fontSize: 24,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),

                    // Page Indicators
                    Row(
                      children: List.generate(
                        _onboardingPages.length,
                        (index) => Container(
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          width: _currentPage == index ? 12 : 8,
                          height: 8,
                          decoration: BoxDecoration(
                            color:
                                _currentPage == index
                                    ? const Color(0xffFFA62B)
                                    : const Color(0XFF82C0CB),
                            borderRadius: BorderRadius.circular(4),
                          ),
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
                        height: 60,
                        decoration: const BoxDecoration(
                          color: Color(0xffFFA62B),
                          shape: BoxShape.circle,
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                            size: 24,
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
