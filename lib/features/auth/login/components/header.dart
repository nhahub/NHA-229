import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_assets.dart';

class HeaderStack extends StatelessWidget {
  const HeaderStack({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Image.asset(
          "assets/images/bluecadre.png",
          width: 1.sw, // responsive full width
          fit: BoxFit.fill,
        ),
        Positioned(
          top: 14.h,
          child: Image.asset(
            AppAssets.logo,
            width: 200.w,
            height: 200.h,
          ),
        ),
      ],
    );
  }
}
