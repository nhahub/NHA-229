import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool hPadding;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.hPadding = true,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: hPadding ? 35 : 0),
      child: SizedBox(
        height: 49.h,
        child: ElevatedButton(
          onPressed: onPressed,
          child: Text(
            text,
            style: Theme.of(context).textTheme.displayLarge?.copyWith(
                  fontSize: 23,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1.5,
                  color: Theme.of(
                    context,
                  ).elevatedButtonTheme.style?.foregroundColor?.resolve({}),
                ),
          ),
        ),
      ),
    );
  }
}
