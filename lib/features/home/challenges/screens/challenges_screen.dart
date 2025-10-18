import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mostawak/core/constants/app_assets.dart';
import 'package:mostawak/features/home/challenges/screens/action_area.dart';
import 'package:mostawak/features/home/challenges/screens/grid_widget.dart';
import 'package:mostawak/features/home/challenges/screens/rank_card.dart';

class ChallengesScreen extends StatelessWidget {
  const ChallengesScreen({super.key});

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
        body: TabBarView(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    RankCard(
                        rankText: "plat V",
                        rankIcon: SvgPicture.asset(
                            "assets/images/challenge_icon.svg"),
                        onButtonPressed: () {}),
                    const SizedBox(height: 10),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Ranked",
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.normal,
                              color: Color(0xFF9E9E9E)),
                        ),
                        SizedBox(width: 20),
                        Text(
                          "|",
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.normal,
                              color: Color(0xFF9E9E9E)),
                        ),
                        SizedBox(width: 20),
                        Text(
                          "Unranked",
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.normal,
                              color: Color(0xFF9E9E9E)),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),

                    gridWidget(),

                    // CustomButton(
                    //   text: 'Ready !',
                    //   onPressed: () {},
                    //   hPadding: false,
                    // )
                      actionArea(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
