import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../generated/l10n.dart';
import '../widgets/timer_button.dart';
import '../widgets/otp_fields.dart';
import 'confirm_reset_screen.dart';

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
    _pinFocusNode.unfocus();
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
          padding: EdgeInsets.symmetric(horizontal: 28.w),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 50.h),
            child: Column(
              children: <Widget>[
                Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text(
                    S.of(context).checkYourEmail,
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                ),
                SizedBox(height: 8.h),
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
                SizedBox(height: 30.h),
                OtpFields(
                  formKey: _formKey,
                  pinController: _pinController,
                  focusNode: _pinFocusNode,
                ),
                SizedBox(height: 30.h),
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
                SizedBox(height: 12.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      S.of(context).gotEmail,
                      style: Theme.of(
                        context,
                      ).textTheme.bodySmall?.copyWith(fontSize: 12),
                    ),
                    TimerButton(
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
