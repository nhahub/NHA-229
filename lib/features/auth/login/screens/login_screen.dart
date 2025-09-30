import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'signup_screen.dart';
import '../components/header.dart';
import '../components/accept_term_row.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_textfield.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: 1.sh),
            child: IntrinsicHeight(
              child: Column(
                children: [
                  const HeaderStack(),
                  SizedBox(height: 20.h),
                  Image.asset(
                    "assets/images/login.png",
                    width: 300.w,
                    height: 250.h,
                  ),
                  SizedBox(height: 20.h),
                  CustomTextfield(controller: email, hintText: "Email"),
                  SizedBox(height: 30.h),
                  CustomTextfield(controller: password, hintText: "Password"),
                  SizedBox(height: 30.h),
                  // TODO: Add Forgot Password Button
                  const Spacer(),
                  CustomButton(text: "LOGIN", onPressed: () {}),
                  RowStatements(
                    showCheckbox: false,
                    normalText: "Don't have an account? ",
                    linkText: "Sign up",
                    onLinkTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignupScreen()),
                      );
                    },
                  ),
                  SizedBox(height: 20.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
