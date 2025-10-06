import 'package:flutter/material.dart';
import '../widgets/custom_text_field.dart';
import 'otp_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgetPasswordEmailScreen extends StatelessWidget {
  ForgetPasswordEmailScreen({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_sharp, color: Color(0xff16697b)),
          padding: const EdgeInsets.symmetric(horizontal: 28),
        ),
      ),
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 50),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  "Forgot password",
                  style: TextStyle(
                    color: Color(0xFF16697B),
                    fontWeight: FontWeight.w600,
                    fontSize: 36,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  "please enter your email to reset\n the password",
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
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),

                  child: CustomTextField(
                    controller: emailController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                        return 'Please enter a valid email';
                      }
                      return null;
                    },
                     hintText: 'Enter Email',
                    obscureText: false,
                  ),
                ),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) => const OtpScreen(
                              email: "emailController.text.trim()",
                            ),
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF16697B),
                  foregroundColor: const Color(0xFFECE7E3),
                  minimumSize: const Size(200, 50),
                ),
                child: const Text(
                  " Reseat Password",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.w400),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
