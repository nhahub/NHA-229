import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'signup_screen.dart';
import '../components/header.dart';
import '../components/accept_term_row.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_textfield.dart';
import '../../forgot_password/screens/forget_password_email_screen.dart';

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
                  // TODO: Add visibility toggle button to show/hide password
                  SizedBox(height: 30.h),
                  // TODO: Add Forgot Password Button
                  const Spacer(),
                  // TODO: fix the alignment issue here
                  CustomButton(
                    text: "LOGIN",
                    onPressed: () {
                      // TODO: remove this code and add the correct login logic
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (context) =>
                                   ForgetPasswordEmailScreen(),
                        ),
                      );
                    },
                  ),
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
                  // TODO: add sign with google button
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
