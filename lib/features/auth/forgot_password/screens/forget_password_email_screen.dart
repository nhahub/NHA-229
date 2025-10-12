import 'package:flutter/material.dart';
import '../../login/widgets/custom_textfield.dart';
import '../../login/widgets/custom_button.dart';
import 'otp_screen.dart';

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
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              OtpScreen(email: emailController.text.trim()),
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
