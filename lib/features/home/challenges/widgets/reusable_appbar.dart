import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReusableAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String centerImage;
  final bool showTabs;
  final List<String>? tabTitles;

  const ReusableAppBar({
    super.key,
    required this.centerImage,
    this.showTabs = true,
    this.tabTitles,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Builder(
        builder: (context) => IconButton(
          onPressed: () => Scaffold.of(context).openDrawer(),
          icon: SvgPicture.asset(
            'assets/images/drawer.svg',
            width: 25.w,
            height: 25.h,
          ),
        ),
      ),
      title: SvgPicture.asset(
        centerImage,
      ),
      centerTitle: true,
      toolbarHeight: 80.h,
      bottom: showTabs
          ? PreferredSize(
        preferredSize: Size.fromHeight(40.h),
        child: Container(
          color: const Color(0xff489eb5),
          child: TabBar(
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white70,
            labelStyle: Theme.of(context).textTheme.bodySmall,
            tabs: (tabTitles ?? const ['Home', 'Learn', 'Challenges'])
                .map((title) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Text(title),
            ))
                .toList(),
          ),
        ),
      )
          : null,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(showTabs ? 120.h : 80.h);
}
