import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mostawak/core/constants/app_colors.dart';

class FeatureCard extends StatelessWidget {
  final String title;
  final String? subtitle;
  final String buttonText;
  final Color backgroundColor;
  final Color buttonColor;
  final Color? titleColor;
  final String? imageUrl;
  final VoidCallback onPressed;

  const FeatureCard({
    super.key,
    required this.title,
    this.subtitle,
    required this.buttonText,
    this.backgroundColor = MyColors.backgroundColor,
    this.buttonColor = MyColors.buttonColor,
    this.titleColor,
    this.imageUrl,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (imageUrl != null)
            Row(
              children: [
                Expanded(
                  child: Text(
                    title,
                    style: TextStyle(
                      color: titleColor ?? MyColors.textColor,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w700,
                      fontFamily: "BigShoulders",
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                SvgPicture.asset(
                  imageUrl!,
                  width: 130.w,
                  height: 130.h,
                ),
              ],
            )
          else
            Stack(
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w700,
                    fontFamily: "BigShoulders",
                    foreground: Paint()
                      ..style = PaintingStyle.stroke
                      ..strokeWidth = 3
                      ..color = MyColors.borderColor,
                  ),
                ),
                Text(
                  title,
                  style: TextStyle(
                    color: titleColor ?? MyColors.accentColor,
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w700,
                    fontFamily: "BigShoulders",
                  ),
                ),
              ],
            ),
          if (subtitle != null) ...[
            SizedBox(height: 12.h),
            Text(
              subtitle!,
              style: TextStyle(
                color: MyColors.textColor,
                fontSize: 13.sp,
              ),
            ),
          ],
          SizedBox(height: 24.h),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: onPressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: MyColors.primary,
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    buttonText,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w700,
                      fontFamily: "BigShoulders",
                    ),
                  ),
                  const Icon(Icons.arrow_forward, color: Colors.white),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
