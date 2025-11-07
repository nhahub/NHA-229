import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mostawak/core/constants/app_assets.dart';
import 'package:mostawak/core/widgets/custom_drawer.dart';
import 'package:mostawak/features/home/learn/screens/learn_screen.dart';
import '../../home/screens/home_screen.dart';
import '../../challenges/screens/challenges_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          leading: Builder(
            builder: (context) => IconButton(
              onPressed: () => Scaffold.of(context).openDrawer(),
              icon: SvgPicture.asset(
                AppAssets.drawerIcon,
                width: 25,
                height: 25,
              ),
            ),
          ),
          title: SvgPicture.asset(
            AppAssets.svgLogo,
            height: 70.h,
          ),
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
        body: const SafeArea(
          child: TabBarView(
            children: [
              HomePage(),
              LearnScreen(),
              ChallengesScreen(),
            ],
          ),
        ),
        drawer: const CustomDrawer(),
      ),
    );
  }
}
