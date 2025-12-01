import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mostawak/generated/l10n.dart';
import 'package:mostawak/services/auth_service.dart';
import '../../home/home/screens/main_screen.dart';
import '../login/screens/login_screen.dart';
import '../login/components/header.dart';
import '../login/components/accept_term_row.dart';
import '../login/widgets/custom_textfield.dart';
import '../login/widgets/custom_button.dart';
import '../login/widgets/or_divider.dart';
import '../login/widgets/google_button.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();

  bool isLoading = false;

  @override
  void dispose() {
    name.dispose();
    email.dispose();
    password.dispose();
    confirmPassword.dispose();
    super.dispose();
  }

  void _showSnackBar(String message) {
    if (mounted) {
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
      body: Stack(
        children: [
          SafeArea(
            top: false,
            child: SingleChildScrollView(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: 1.sh),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      const HeaderStack(),
                      CustomTextFormField(
                        controller: name,
                        hintText: S.current.fullName,
                      ),
                      SizedBox(height: 20.h),
                      CustomTextFormField(
                          controller: email, hintText: S.current.email),
                      SizedBox(height: 20.h),
                      CustomTextFormField(
                        controller: password,
                        hintText: S.current.password,
                        showVisibilityButton: true,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return S.current.fieldRequired;
                          }
                          if (value.trim().length < 6) {
                            return S.current.passwordLength;
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20.h),
                      CustomTextFormField(
                        controller: confirmPassword,
                        hintText: "${S.current.confirm} ${S.current.password}",
                        showVisibilityButton: true,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return S.current.fieldRequired;
                          }
                          if (value.trim() != password.text.trim()) {
                            return S.current.passwordsNotMatch;
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 30.h),
                      RowStatements(
                        normalText: "${S.current.accept} ",
                        linkText: S.current.termsConditions,
                        onLinkTap: () {
                          _showSnackBar(S.current.termsConditions);
                        },
                      ),
                      const SizedBox(height: 20),
                      CustomButton(
                        text: S.current.signUp,
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            setState(() {
                              isLoading = true;
                            });

                            try {
                              final user = await AuthService()
                                  .signUpWithEmailAndPassword(
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
                            } finally {
                              if (mounted) {
                                setState(() {
                                  isLoading = false;
                                });
                              }
                            }
                          }
                        },
                      ),
                      const SizedBox(height: 20),
                      const OrDivider(),
                      const SizedBox(height: 20),
                      GoogleSignButton(
                        text: S.current.continueWithGoogle,
                        onPressed: () async {
                          setState(() {
                            isLoading = true;
                          });

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
                              _showSnackBar(S.current.failedToSignUp);
                            }
                          } catch (e) {
                            _showSnackBar(e.toString());
                          } finally {
                            if (mounted) {
                              setState(() {
                                isLoading = false;
                              });
                            }
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
                          normalText: "${S.current.alreadyHaveAccount} ",
                          linkText: S.current.login,
                          onLinkTap: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LoginScreen(),
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
          if (isLoading)
            Container(
              color: Colors.black.withValues(alpha: 0.5),
              child: const Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
