import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pinput/pinput.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../screens/confirm_reset_screen.dart';

/// This is the basic usage of Pinput
/// For more examples check out the demo directory
class OtpFields extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController pinController;
  final FocusNode focusNode;

  const OtpFields({
    super.key,
    required this.formKey,
    required this.pinController,
    required this.focusNode,
  });

  @override
  State<OtpFields> createState() => _OtpFieldsState();
}

class _OtpFieldsState extends State<OtpFields> {
  @override
  Widget build(BuildContext context) {
    const focusedBorderColor = Color.fromRGBO(23, 171, 144, 1);
    const fillColor = Color.fromRGBO(243, 246, 249, 0);
    const int pins = 6;

    final defaultPinTheme = PinTheme(
      width: 40.w,
      height: 40.h,
      textStyle: const TextStyle(
        fontSize: 16,
        color: Color.fromRGBO(30, 60, 87, 1),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xff9E9E9E)),
      ),
    );

    /// Optionally you can use form to validate the Pinput
    return Form(
      key: widget.formKey,
      child: Directionality(
        // Specify direction if desired
        textDirection: TextDirection.ltr,
        child: Pinput(
          length: pins,
          crossAxisAlignment: CrossAxisAlignment.center,
          // You can pass your own SmsRetriever implementation based on any package
          // in this example we are using the SmartAuth
          enableInteractiveSelection: true,
          controller: widget.pinController,
          focusNode: widget.focusNode,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          defaultPinTheme: defaultPinTheme,
          separatorBuilder: (index) => SizedBox(width: 6.w),
          validator: (value) {
            return (value != null && value.length < pins)
                ? 'Verification failed. Check the code and try again'
                : null;
          },
          hapticFeedbackType: HapticFeedbackType.lightImpact,
          onTapOutside: (event) {
            widget.focusNode.unfocus();
          },
          onCompleted: (pin) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ConfirmResetScreen(),
              ),
            );
          },
          cursor: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 9),
                width: 22,
                height: 1,
                color: focusedBorderColor,
              ),
            ],
          ),
          focusedPinTheme: defaultPinTheme.copyWith(
            decoration: defaultPinTheme.decoration!.copyWith(
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: const Color(0xff16697B)),
            ),
          ),
          submittedPinTheme: defaultPinTheme.copyWith(
            decoration: defaultPinTheme.decoration!.copyWith(
              color: fillColor,
              border: Border.all(color: const Color(0xff16697B)),
            ),
          ),
          errorPinTheme: defaultPinTheme.copyBorderWith(
            border: Border.all(color: const Color(0xffF44336)),
          ),
          errorTextStyle: GoogleFonts.poppins(
            fontSize: 12,
            color: const Color(0xffF44336),
          ),
        ),
      ),
    );
  }
}
