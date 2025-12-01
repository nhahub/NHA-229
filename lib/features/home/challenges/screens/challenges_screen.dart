import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mostawak/features/settings/controllers/language_controller.dart';
import 'package:mostawak/generated/l10n.dart';
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
        selectedIndex = -1;
      });
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _navigateToSelected(List<Course> courses) {
    if (selectedIndex == -1) return;

    final selectedCourse = courses[selectedIndex];

    if (selectedCourse.title == S.current.english) {
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
      tabs: [
        Tab(text: S.current.ranked),
        Tab(text: S.current.unranked),
      ],
      labelColor: selectedColor,
      unselectedLabelColor: unselectedColor,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: BlocBuilder<LanguageController, String>(
        builder: (context, state) {
          final List<Course> courses = [
            Course(S.current.english, 'assets/images/English.svg'),
            Course(S.current.programming, 'assets/images/Programming.svg'),
            Course(S.current.science, 'assets/images/Science.svg'),
            Course(S.current.math, 'assets/images/Mathematics.svg'),
            Course(S.current.english, 'assets/images/English.svg'),
            Course(S.current.programming, 'assets/images/Programming.svg'),
          ];
          return Column(
            children: [
              SizedBox(height: 10.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: RankCard(
                  rankText: "Plat V",
                  rankIcon:
                      SvgPicture.asset("assets/images/challenge_icon.svg"),
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
              SizedBox(height: 20.h),
              _buildTabBar(),
              SizedBox(height: 20.h),
              SizedBox(
                height: 300.h,
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    CoursesGrid(
                      selectedIndex: selectedIndex,
                      onCourseSelected: (index) {
                        setState(() => selectedIndex = index);
                      },
                      courses: courses,
                    ),
                    CoursesGrid(
                      selectedIndex: selectedIndex,
                      onCourseSelected: (index) {
                        setState(() => selectedIndex = index);
                      },
                      courses: courses,
                    ),
                  ],
                ),
              ),
              actionArea(onPressed: () => _navigateToSelected(courses)),
            ],
          );
        },
      ),
    );
  }
}
