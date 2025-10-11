import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mostawak/core/constants/app_assets.dart';

class GoogleSignButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const GoogleSignButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 0.8.sw, // 80% of screen width
      child: OutlinedButton.icon(
        style: OutlinedButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 14.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          side: const BorderSide(color: Color(0xFF006D77), width: 1.2),
        ),
        onPressed: onPressed,
        icon: Image.asset(
          AppAssets.googleIcon,
          height: 24.h,
          width: 24.w,
        ),
        label: Text(
          text,
          style: TextStyle(
            color: const Color(0xFF006D77),
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
