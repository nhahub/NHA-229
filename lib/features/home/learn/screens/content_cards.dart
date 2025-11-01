import 'package:flutter/material.dart';
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
        height: 150,
        margin: const EdgeInsets.symmetric(vertical: 10),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: cardColor,
          borderRadius: BorderRadius.circular(25),
          border: isSelected
              ? Border.all(color: selectedBorderColor, width: 3.0)
              : Border.all(color: unselectedBorderColor, width: 3.0),
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
            const Spacer(),
            Text(
              title,
              style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.normal,
                  color: foregroundColor),
            )
          ],
        ),
      ),
    );
  }
}
