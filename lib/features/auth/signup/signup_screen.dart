import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mostawak/services/auth_service.dart';
import '../../home/home/screens/main_screen.dart';
import '../login/screens/login_screen.dart';
import '../login/components/header.dart';
import '../login/components/accept_term_row.dart';
import '../login/widgets/custom_textfield.dart';
import '../login/widgets/custom_button.dart';
import '../login/widgets/or_divider.dart';
import '../login/widgets/google_button.dart';

class SignupScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey();
  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();

  SignupScreen({super.key});

  void _showSnackBar(String message) {
    final context = _scaffoldKey.currentContext;
    if (context != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message)),
      );
    }
  }

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
                    CustomTextFormField(
                      controller: name,
                      hintText: "Full Name",
                    ),
                    SizedBox(height: 20.h),
                    CustomTextFormField(controller: email, hintText: "Email"),
                    SizedBox(height: 20.h),
                    CustomTextFormField(
                      controller: password,
                      hintText: "Password",
                      showVisibilityButton: true,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'This field cannot be empty';
                        }
                        if (value.trim().length < 6) {
                          return 'Password must be at least 6 characters';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20.h),
                    CustomTextFormField(
                      controller: confirmPassword,
                      hintText: "Confirm Password",
                      showVisibilityButton: true,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'This field cannot be empty';
                        }
                        if (value.trim() != password.text.trim()) {
                          return "Passwords don't match";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 30.h),
                    RowStatements(
                      normalText: "I accept ",
                      linkText: "Terms and Conditions",
                      onLinkTap: () {
                        _showSnackBar("Terms & Conditions");
                      },
                    ),
                    const SizedBox(height: 20),
                    CustomButton(
                      text: "Sign Up",
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          try {
                            final user =
                                await AuthService().signUpWithEmailAndPassword(
                              email.text.trim(),
                              password.text.trim(),
                              name.text.trim(),
                            );

                            if (user != null) {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const MainScreen(),
                                ),
                              );
                            }
                          } catch (e) {
                            _showSnackBar(e.toString());
                          }
                        }
                      },
                    ),
                    const SizedBox(height: 20),
                    const OrDivider(),
                    const SizedBox(height: 20),
                    GoogleSignButton(
                      text: "Sign Up with Google",
                      onPressed: () async {
                        try {
                          final user = await AuthService().signInWithGoogle();
                          if (user != null) {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const MainScreen(),
                              ),
                            );
                          } else {
                            _showSnackBar("Google Sign-Up failed");
                          }
                        } catch (e) {
                          _showSnackBar(e.toString());
                        }
                      },
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 30.w,
                        vertical: 20.h,
                      ),
                      child: RowStatements(
                        showCheckbox: false,
                        normalText: "Already have an account? ",
                        linkText: "Login",
                        onLinkTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginScreen(),
                            ),
                          );
                        },
                      ),
                    ),
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
