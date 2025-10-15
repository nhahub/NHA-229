import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mostawak/core/constants/app_assets.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: SvgPicture.asset(AppAssets.svgLogo),
          centerTitle: true,
          toolbarHeight: 80.h,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(40.h),
            child: Container(
              color: const Color(0xff489eb5),
              child: TabBar(
                labelColor: Colors.white,
                labelStyle: Theme.of(context).textTheme.bodySmall,
                unselectedLabelColor: Colors.white70,
                tabs: const [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    child: Text('Home'),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    child: Text('Learn'),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    child: Text('Challenges'),
                  ),
                ],
              ),
            ),
          ),
        ),
        body: const TabBarView(
          children: [
            /// Screens to be placed here
            Center(
              child: Text('Welcome to the Home Screen!'),
            ),
            Center(
              child: Text('Welcome to the Learn Screen!'),
            ),
            Center(
              child: Text('Welcome to the Challenges Screen!'),
            ),
          ],
        ),
      ),
    );
  }
}
