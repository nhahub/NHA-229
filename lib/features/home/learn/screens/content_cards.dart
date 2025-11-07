import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ContentCards extends StatelessWidget {
  final String title;
  final String imagePath;
  final VoidCallback onTap;
  final bool isSelected;

  final Color cardColor = const Color(0xFF82C0CB);

  final Color foregroundColor = const Color(0xFFECE7E3);

  final Color selectedBorderColor = const Color(0xFFFE9C04);
  final Color unselectedBorderColor = const Color(0xFF16697B);

  const ContentCards({
    super.key,
    required this.title,
    required this.imagePath,
    required this.onTap,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 130.h,
        margin: const EdgeInsets.symmetric(vertical: 10),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: cardColor,
          borderRadius: BorderRadius.circular(25),
          border: isSelected
              ? Border.all(color: selectedBorderColor, width: 1.5)
              : Border.all(color: unselectedBorderColor, width: 1.5),
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              imagePath,
              width: 100,
              height: 100,
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                    fontSize: 23.sp,
                    fontWeight: FontWeight.w600,
                    color: foregroundColor),
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}