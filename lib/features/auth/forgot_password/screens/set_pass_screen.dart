import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'success_screen.dart';
import '../../../../generated/l10n.dart';
import '../../login/widgets/custom_textfield.dart';

class SetPassScreen extends StatelessWidget {
  SetPassScreen({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 40),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.arrow_back_sharp,
                          color: Color(0xff16697b),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 53),
                  Row(
                    children: [
                      Text(
                        S.current.setNewPassword,
                        style: Theme.of(context).textTheme.displayLarge,
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    S.current.setPasswordMessage,
                    style: Theme.of(context).textTheme.bodySmall,
                    softWrap: true,
                  ),

                  const SizedBox(height: 29),
                  CustomTextFormField(
                    controller: passwordController,
                    hintText: "Password",
                    showVisibilityButton: true,
                    hPadding: false,
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
                  const SizedBox(height: 28),
                  CustomTextFormField(
                    controller: confirmPasswordController,
                    hintText: "Password",
                    showVisibilityButton: true,
                    hPadding: false,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Password is required';
                      }
                      if (value.trim().length < 6) {
                        return 'Password must be at least 6 characters';
                      }
                      if (value != passwordController.text) {
                        return "Passwords don't match";
                      }
                      return null;
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 31.0),
                    child: SizedBox(
                      width: 309.w,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SuccessScreen(),
                              ),
                            );
                          }
                        },
                        child: Text(
                          S.of(context).updatePassword,
                          style: Theme.of(
                            context,
                          ).textTheme.displayLarge?.copyWith(
                            fontSize: 23,
                            fontWeight: FontWeight.w700,
                            color: Theme.of(context)
                                .elevatedButtonTheme
                                .style
                                ?.foregroundColor
                                ?.resolve({}),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
