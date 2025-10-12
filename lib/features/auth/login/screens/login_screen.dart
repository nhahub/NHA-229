import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mostawak/core/constants/app_assets.dart';

import '../widgets/or_divider.dart';
import '../widgets/google_button.dart';
import '../../signup/signup_screen.dart';
import '../components/header.dart';
import '../components/accept_term_row.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_textfield.dart';
import '../../forgot_password/screens/forget_password_email_screen.dart';

class LoginScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
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
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    const HeaderStack(),
                    SizedBox(
                      width: 400.w,
                      height: 200.h,
                      child: Image.asset(
                        AppAssets.loginPNG,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    CustomTextFormField(
                      controller: email,
                      hintText: "Email",
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Email is required';
                        }
                        final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
                        if (!emailRegex.hasMatch(value.trim())) {
                          return 'Enter a valid email';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 10.h),
                    CustomTextFormField(
                      controller: password,
                      hintText: "Password",
                      showVisibilityButton: true,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Password is required';
                        }
                        if (value.trim().length < 6) {
                          return 'Password must be at least 6 characters';
                        }
                        return null;
                      },
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 32.5, top: 10),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    ForgetPasswordEmailScreen(),
                              ),
                            );
                          },
                          child: const Text(
                            "Forgot Password?",
                            style: TextStyle(
                              color: Color(0xffFFA62B),
                              fontSize: 16,
                              decoration: TextDecoration.none,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    CustomButton(
                      text: "Login",
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ForgetPasswordEmailScreen(),
                            ),
                          );
                        } else {}
                      },
                    ),
                    const SizedBox(height: 20),
                    const OrDivider(),
                    const SizedBox(height: 20),
                    GoogleSignButton(
                      text: "Login with Google",
                      onPressed: () {},
                    ),
                    SizedBox(height: 20.h),
                    RowStatements(
                      showCheckbox: false,
                      normalText: "Don't have an account? ",
                      linkText: "Sign up",
                      onLinkTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignupScreen(),
                          ),
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
      ),
    );
  }
}
