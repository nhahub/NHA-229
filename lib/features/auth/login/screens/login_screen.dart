import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mostawak/core/constants/app_assets.dart';
import 'package:mostawak/services/auth_service.dart';
import '../widgets/or_divider.dart';
import '../widgets/google_button.dart';
import '../../signup/signup_screen.dart';
import '../components/header.dart';
import '../components/accept_term_row.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_textfield.dart';
import '../../../home/home/screens/main_screen.dart';
import '../../forgot_password/screens/forget_password_email_screen.dart';

class LoginScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
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
                    Builder(
                      builder: (buttonContext) => CustomButton(
                        text: "Login",
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            try {
                              final user = await AuthService()
                                  .signInWithEmailAndPassword(
                                email.text.trim(),
                                password.text.trim(),
                              );

                              if (user != null) {
                                Navigator.pushReplacement(
                                  buttonContext,
                                  MaterialPageRoute(
                                    builder: (_) => const MainScreen(),
                                  ),
                                );
                              }
                            } catch (e) {
                              String message = 'Something went wrong';
                              if (e is FirebaseAuthException) {
                                switch (e.code) {
                                  case 'user-not-found':
                                    message = 'No user found for this email';
                                    break;
                                  case 'wrong-password':
                                    message = 'Incorrect password';
                                    break;
                                  case 'invalid-email':
                                    message = 'Email format is invalid';
                                    break;
                                  default:
                                    message = e.message ?? message;
                                }
                              }

                              ScaffoldMessenger.of(buttonContext).showSnackBar(
                                SnackBar(content: Text(message)),
                              );
                            }
                          }
                        },
                      ),
                    ),
                    const SizedBox(height: 20),
                    const OrDivider(),
                    const SizedBox(height: 20),
                    Builder(
                      builder: (googleContext) => GoogleSignButton(
                        text: "Login with Google",
                        onPressed: () async {
                          try {
                            final user = await AuthService().signInWithGoogle();

                            if (user != null) {
                              Navigator.pushReplacement(
                                googleContext,
                                MaterialPageRoute(
                                  builder: (_) => const MainScreen(),
                                ),
                              );
                            } else {
                              ScaffoldMessenger.of(googleContext).showSnackBar(
                                const SnackBar(
                                    content: Text("Login with Google failed")),
                              );
                            }
                          } catch (e) {
                            ScaffoldMessenger.of(googleContext).showSnackBar(
                              SnackBar(content: Text(e.toString())),
                            );
                          }
                        },
                      ),
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
