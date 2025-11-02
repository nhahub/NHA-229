import 'package:flutter/material.dart';
import 'package:mostawak/services/auth_service.dart';
import '../../login/widgets/custom_textfield.dart';
import '../../login/widgets/custom_button.dart';
import 'success_screen.dart';

class ForgetPasswordEmailScreen extends StatelessWidget {
  ForgetPasswordEmailScreen({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon:
                  const Icon(Icons.arrow_back_sharp, color: Color(0xff16697b)),
              padding: const EdgeInsets.symmetric(horizontal: 28),
            ),
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 28.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(height: 50),
                    Align(
                      alignment: AlignmentDirectional.centerStart,
                      child: Text(
                        textAlign: TextAlign.start,
                        "Forgot password",
                        style: Theme.of(context).textTheme.displayLarge,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: Text(
                        "please enter your email to reset the password",
                        style: TextStyle(
                          color: Color(0xFF9E9E9E),
                          fontWeight: FontWeight.w400,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    Form(
                      key: _formKey,
                      child: CustomTextFormField(
                        controller: emailController,
                        hPadding: false,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          }
                          if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                            return 'Please enter a valid email';
                          }
                          return null;
                        },
                        hintText: "Email",
                      ),
                    ),
                    const SizedBox(height: 24),
                    CustomButton(
                      text: "Reset Password",
                      hPadding: false,
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SuccessScreen(),
                            ),
                          );
                          await AuthService().sendPasswordResetEmail(
                              emailController.text.trim());
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
