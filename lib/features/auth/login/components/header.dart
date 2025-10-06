import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/constants/app_assets.dart';

class HeaderStack extends StatelessWidget {
  const HeaderStack({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 260.h, // adjust as needed
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          SvgPicture.asset(
            "assets/images/Component 7.svg",
            width: 1.sw,
            fit: BoxFit.fill,
          ),
          Positioned(
            top: -10,
            child: Image.asset(
              AppAssets.logo,
              width: 200.w,
              height: 200.h,
            ),
          ),
        ],
      ),
    );
  }
}


