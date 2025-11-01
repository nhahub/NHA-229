import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'courses_grid.dart';
import 'action_area.dart';
import 'rank_card.dart';

class ChallengesScreen extends StatefulWidget {
  const ChallengesScreen({super.key});

  @override
  ChallengesScreenState createState() => ChallengesScreenState();
}

class ChallengesScreenState extends State<ChallengesScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final Color selectedTabColor = const Color(0xFFFE9C04);
  final Color unselectedTextColor = const Color(0xFF9E9E9E);

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);

    _tabController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Widget _buildCustomTabBar() {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        // color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(10),
      ),
      child: TabBar(
        controller: _tabController,
        indicatorWeight: 0.1,
        indicator: BoxDecoration(
          color: selectedTabColor.withValues(alpha: 200),
          borderRadius: BorderRadius.circular(10),
        ),
        indicatorSize: TabBarIndicatorSize.tab,
        tabs: [
          Tab(
            child: Text(
              'Ranked',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: _tabController.index == 0
                    ? selectedTabColor
                    : unselectedTextColor,
              ),
            ),
          ),
          Tab(
            child: Text(
              'Unranked',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: _tabController.index == 1
                    ? selectedTabColor
                    : unselectedTextColor,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            RankCard(
                rankText: "plat V",
                rankIcon: SvgPicture.asset("assets/images/challenge_icon.svg"),
                onButtonPressed: () {}),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: _buildCustomTabBar(),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 400,
              child: TabBarView(
                controller: _tabController,
                children: [
                  CoursesGrid(courses: rankedCourses),
                  CoursesGrid(courses: unrankedCourses),
                ],
              ),
            ),
            actionArea(),
          ],
        ),
      ),
    );
  }
}
