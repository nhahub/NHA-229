import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mostawak/core/constants/app_assets.dart';
import 'package:mostawak/generated/l10n.dart';
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

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  bool isLoading = false;

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
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
                      hintText: S.current.email,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return S.current.fieldRequired;
                        }
                        final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
                        if (!emailRegex.hasMatch(value.trim())) {
                          return S.current.validEmail;
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 10.h),
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
                          child: Text(
                            S.current.forgotPassword,
                            style: const TextStyle(
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
                        text: S.current.login,
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            setState(() {
                              isLoading = true;
                            });
                            
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
                              String message = S.current.failedToLogin;
                              if (e is FirebaseAuthException) {
                                switch (e.code) {
                                  case 'user-not-found':
                                    message =
                                        'No user found for this email';
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
                            
                              ScaffoldMessenger.of(buttonContext)
                                  .showSnackBar(
                                SnackBar(content: Text(message)),
                              );
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
                    ),
                    const SizedBox(height: 20),
                    const OrDivider(),
                    const SizedBox(height: 20),
                    Builder(
                      builder: (googleContext) => GoogleSignButton(
                        text: S.current.continueWithGoogle,
                        onPressed: () async {
                          setState(() {
                            isLoading = true;
                          });
                            
                          try {
                            final user =
                                await AuthService().signInWithGoogle();
                            
                            if (user != null) {
                              Navigator.pushReplacement(
                                googleContext,
                                MaterialPageRoute(
                                  builder: (_) => const MainScreen(),
                                ),
                              );
                            } else {
                              ScaffoldMessenger.of(googleContext)
                                  .showSnackBar(
                                SnackBar(
                                    content:
                                        Text(S.current.failedToLogin)),
                              );
                            }
                          } catch (e) {
                            ScaffoldMessenger.of(googleContext)
                                .showSnackBar(
                              SnackBar(content: Text(e.toString())),
                            );
                          } finally {
                            if (mounted) {
                              setState(() {
                                isLoading = false;
                              });
                            }
                          }
                        },
                      ),
                    ),
                    SizedBox(height: 20.h),
                    RowStatements(
                      showCheckbox: false,
                      normalText: S.current.doNotHaveAccount,
                      linkText: S.current.signUp,
                      onLinkTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignupScreen(),
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
