import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InfoCard extends StatelessWidget {
  final String title1;
  final String value1;

  final String title2;
  final String? imagePath2;

  final String title3;
  final String imagePath3;
  final String buttonText;

  final VoidCallback onButtonPressed;

  // Optional customizations
  final TextStyle? titleStyle;
  final TextStyle? valueStyle;
  final Color? cardColor;
  final Color? buttonColor;
  final Color? buttonTextColor;
  final double spacing;
  final double borderRadius;

  const InfoCard({
    super.key,
    required this.title1,
    required this.value1,
    required this.title2,
    this.imagePath2,
    required this.title3,
    required this.imagePath3,
    required this.buttonText,
    required this.onButtonPressed,
    this.titleStyle,
    this.valueStyle,
    this.cardColor,
    this.buttonColor,
    this.buttonTextColor,
    this.spacing = 12.0,
    this.borderRadius = 16.0,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: cardColor ?? Colors.white,
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius.r),
      ),
      margin: EdgeInsets.all(16.w),
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          children: [
            // Row 1: text + text
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title1,
                  style: titleStyle ??
                      TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14.sp,
                      ),
                ),
                Text(
                  value1,
                  style: valueStyle ??
                      TextStyle(
                        fontSize: 12.sp,
                      ),
                ),
              ],
            ),
            SizedBox(height: spacing.h),

            // Row 2: text + optional image
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title2,
                  style: titleStyle ??
                      TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12.sp,
                      ),
                ),
                if (imagePath2 != null)
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.r),
                    child: Image.asset(
                      imagePath2!,
                      width: 120.w,
                      height: 80.h,
                      fit: BoxFit.cover,
                    ),
                  ),
              ],
            ),
            SizedBox(height: spacing.h),

            // Row 3: (image + text) + button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset(
                      imagePath3,
                      width: 24.w,
                      height: 24.h,
                    ),
                    SizedBox(width: 8.w),
                    Text(
                      title3,
                      style: titleStyle ??
                          TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.orange,
                            fontSize: 14.sp,
                          ),
                    ),
                  ],
                ),
                OutlinedButton(
                  onPressed: onButtonPressed,
                  style: OutlinedButton.styleFrom(
                    backgroundColor: buttonColor ?? Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24.r),
                    ),
                    padding: EdgeInsets.symmetric(
                      vertical: 8.h,
                      horizontal: 16.w,
                    ),
                  ),
                  child: Text(
                    buttonText,
                    style: TextStyle(
                      color: buttonTextColor ?? Colors.white,
                      fontSize: 14.sp,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
