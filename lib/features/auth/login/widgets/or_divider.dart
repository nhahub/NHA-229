import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mostawak/generated/l10n.dart';

class OrDivider extends StatelessWidget {
  final double lineThickness;
  final Color lineColor;
  final Color textColor;

  const OrDivider({
    super.key,
    this.lineThickness = 2,
    this.lineColor = Colors.grey,
    this.textColor = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Divider(
            color: lineColor,
            thickness: lineThickness,
            indent: 40.w,
            endIndent: 8.w,
          ),
        ),
        Text(
          S.current.or,
          style: TextStyle(
            color: textColor,
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        Expanded(
          child: Divider(
            color: lineColor,
            thickness: lineThickness,
            indent: 8.w,
            endIndent: 40.w,
          ),
        ),
      ],
    );
  }
}
