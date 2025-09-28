import 'package:flutter/material.dart';
//import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController controller = PageController();

  final List<Map<String, String>> onboardingData = [
    {
      "image": "assets/images/mostawakLogo.png",
      "title": "Welcome to mostawak !",
      "description": "Your place to learn and develop in simple and easy steps"
    },
    {
      "image": "assets/images/login.png",
      "title": "Challenge Your Friends !",
      "description": "Compete with your friend your knowledge, and make learning more exciting."
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffECE7E3),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: controller,
                itemCount: onboardingData.length,
                itemBuilder: (context, index) {
                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          height: 400,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Color(0xff16697B),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(150),
                              bottomRight: Radius.circular(150),
                            ),
                          ),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Image.asset(
                              onboardingData[index]["image"]!,
                              width: 300,
                              height: 300,
                              fit: BoxFit.contain,
                            ),
                          ],
                        ),
                        ),
                        
                        SizedBox(height: 20),
                        
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: index == 0 
                            ? RichText(
                                textAlign: TextAlign.center,
                                text: TextSpan(
                                  style: TextStyle(
                                    fontSize: 35,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: "Bebas Neue",
                                    color: Color(0XFF82C0CB),
                                  ),
                                  children: [
                                    TextSpan(text: "Welcome to "),
                                    TextSpan(
                                      text: "Mostawak !",
                                      style: TextStyle(color: Color(0XFF16697B)),
                                    ),
                                   
                                  ],
                                ),
                              )
                            : RichText(
                                textAlign: TextAlign.center,
                                text: TextSpan(
                                  style: TextStyle(
                                    fontSize: 35,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: "Bebas Neue",
                                    color: Color(0XFF82C0CB),
                                  ),
                                  children: [
                                    TextSpan(text: "Challenge Your Friends !"),
                                    
                                  ],
                                ),
                              ),
                        ),
                        
                        SizedBox(height: 15),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: Text(
                            onboardingData[index]["description"]!,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 25,
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
            
            // Bottom buttons section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Skip Button
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0XFF16697B),
                     
                      
                      //foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, "/home");
                    },
                    child: Text("Skip", style: TextStyle(color: Color(0XFFECE7E3),fontFamily: "Bebas Neue",fontSize: 24,fontWeight: FontWeight.w400)),
                  ),
                  
                  // Next Button (Circle with icon)
                  GestureDetector(
                    onTap: () {
                      if (controller.page == onboardingData.length - 1) {
                        Navigator.pushReplacementNamed(context, "/home");
                      } else {
                        controller.nextPage(
                          duration: Duration(milliseconds: 500),
                          curve: Curves.easeInOut,
                        );
                      }
                    },
                    child: Container(
                      width: 37,
                      height: 60,
                      decoration: BoxDecoration(
                        color: Color(0xffFFA62B),
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Icon(Icons.arrow_forward, color: Colors.white, size: 24),
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
