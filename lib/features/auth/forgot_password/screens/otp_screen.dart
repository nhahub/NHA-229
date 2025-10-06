import 'package:flutter/material.dart';

import '../../../../generated/l10n.dart';
import '../widgets/otp_fields.dart';
import 'confirm_reset_screen.dart';

// TODO: implement screenutils in the screen

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key, required this.email});

  final String email;

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final _formKey = GlobalKey<FormState>();
  final _pinController = TextEditingController();
  final _pinFocusNode = FocusNode();

  void _verify() {
    setState(() {
      _pinFocusNode.unfocus();
    });
    if (_formKey.currentState!.validate()) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const ConfirmResetScreen()),
      );
    }
  }

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
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 50),
            child: Column(
              children: <Widget>[
                Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text(
                    S.of(context).checkYourEmail,
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                ),
                const SizedBox(height: 8),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: S.of(context).sentMessage1,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      TextSpan(
                        text: widget.email,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      TextSpan(
                        text: S.of(context).sentMessage2,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
                const SizedBox(height: 30),
                OtpFields(
                  formKey: _formKey,
                  pinController: _pinController,
                  focusNode: _pinFocusNode,
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: _verify,
                  child: Text(
                    S.of(context).verifyCode,
                    style: Theme.of(context).textTheme.displayLarge?.copyWith(
                      fontSize: 23,
                      fontWeight: FontWeight.w700,
                      color: Theme.of(
                        context,
                      ).elevatedButtonTheme.style?.foregroundColor?.resolve({}),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      S.of(context).gotEmail,
                      style: Theme.of(
                        context,
                      ).textTheme.bodySmall?.copyWith(fontSize: 12),
                    ),
                    TextButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(S.of(context).emailResent),
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(12),
                              ),
                            ),
                          ),
                        );
                      },
                      // TODO: Add counter
                      child: Text(
                        S.of(context).resendEmail,
                        style: Theme.of(
                          context,
                        ).textButtonTheme.style?.textStyle?.resolve({}),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _pinController.dispose();
    _pinFocusNode.dispose();
  }
}
