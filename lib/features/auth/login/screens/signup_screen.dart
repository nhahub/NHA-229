import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'login_screen.dart';
import '../components/header.dart';
import '../components/accept_term_row.dart';
import '../widgets/custom_textfield.dart';
import '../widgets/custom_button.dart';

class SignupScreen extends StatelessWidget {
  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();

  SignupScreen({super.key});

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
                  // TODO: replace this image with the new one if possible
                  SizedBox(height: 50.h),
                  CustomTextfield(controller: name, hintText: "Full Name"),
                  SizedBox(height: 30.h),
                  CustomTextfield(controller: email, hintText: "Email"),
                  SizedBox(height: 30.h),
                  // TODO: Add visibility toggle button to show/hide password
                  CustomTextfield(controller: password, hintText: "Password"),
                  SizedBox(height: 30.h),
                  // TODO: Add visibility toggle button to show/hide password
                  CustomTextfield(
                    controller: confirmPassword,
                    hintText: "Confirm Password",
                  ),
                  SizedBox(height: 30.h),
                  RowStatements(
                    normalText: "I accept ",
                    linkText: "Terms and Conditions",
                    onLinkTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Terms & Conditions"),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                          ),
                        ),
                      );
                    },
                  ),
                  // TODO: fix the alignment issue here
                  const Spacer(),
                  CustomButton(text: "SIGN UP!", onPressed: () {}),
                  RowStatements(
                    showCheckbox: false,
                    normalText: "Already have an account? ",
                    linkText: "Login",
                    onLinkTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                      );
                    },
                  ),
                  SizedBox(height: 20.h),
                  // TODO: Add Sign with Google Buttons
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
