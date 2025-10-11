import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../login/widgets/google_button.dart';
import '../login/widgets/or_divider.dart';
import '../login/screens/login_screen.dart';
import '../login/components/header.dart';
import '../login/components/accept_term_row.dart';
import '../login/widgets/custom_textfield.dart';
import '../login/widgets/custom_button.dart';

class SignupScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
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
                    ),
                    SizedBox(height: 20.h),
                    CustomTextFormField(
                      controller: confirmPassword,
                      hintText: "Confirm Password",
                      showVisibilityButton: true,
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
                              borderRadius: BorderRadius.all(
                                Radius.circular(12),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 20),
                    CustomButton(
                      text: "Sign up !",
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                        } else {}
                      },
                    ),
                    const SizedBox(height: 20),
                    const OrDivider(),
                    const SizedBox(height: 20),
                    GoogleSignButton(
                      text: "Sign up with Google",
                      onPressed: () {},
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 30.w,
                        vertical: 20.h,
                      ),
                      child: Column(
                        children: [
                          RowStatements(
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
                          SizedBox(height: 20.h),
                        ],
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
