import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'courses_grid.dart';
import 'action_area.dart';
import 'english_challenge_room.dart';
import '../screens/coming_soon.dart';
import 'rank_card.dart';
import 'package:mostawak/features/stats_and_dashboard/stats_and_dashboard.dart';

class ChallengesScreen extends StatefulWidget {
  const ChallengesScreen({super.key});

  @override
  State<ChallengesScreen> createState() => _ChallengesScreenState();
}

class _ChallengesScreenState extends State<ChallengesScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int selectedIndex = -1;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      setState(() {
        selectedIndex = -1; // يلغي الاختيار لما التاب يتغير
      });
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _navigateToSelected() {
    if (selectedIndex == -1) return;

    // عند استخدام شبكة مكررة (6 عناصر)، نحسب المؤشر الأصلي عبر modulo
    final baseIndex = selectedIndex % courses.length;
    final selectedCourse = courses[baseIndex].title;

    if (selectedCourse == "English") {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const EnglishChallengeRoomScreen()),
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const ComingSoonScreen()),
      );
    }
  }

  Widget _buildTabBar() {
    const selectedColor = Color(0xFFFE9C04);
    const unselectedColor = Color(0xFF9E9E9E);

    return TabBar(
      controller: _tabController,
      indicatorColor: selectedColor,
      tabs: const [
        Tab(text: 'Ranked'),
        Tab(text: 'Unranked'),
      ],
      labelColor: selectedColor,
      unselectedLabelColor: unselectedColor,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: RankCard(
              rankText: "Plat V",
              rankIcon: SvgPicture.asset("assets/images/challenge_icon.svg"),
              onButtonPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const StatsAndDashboard(),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 20),
          _buildTabBar(),
          const SizedBox(height: 20),
          SizedBox(
            height: 400,
            child: TabBarView(
              controller: _tabController,
              children: [
                CoursesGrid(
                  selectedIndex: selectedIndex,
                  onCourseSelected: (index) {
                    setState(() => selectedIndex = index);
                  },
                ),
                CoursesGrid(
                  selectedIndex: selectedIndex,
                  onCourseSelected: (index) {
                    setState(() => selectedIndex = index);
                  },
                ),
              ],
            ),
          ),
          ActionArea(onPressed: _navigateToSelected),
        ],
      ),
    );
  }
}
