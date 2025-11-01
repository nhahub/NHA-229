import 'package:flutter/material.dart';
import 'package:mostawak/core/constants/app_colors.dart';
import 'package:mostawak/features/stats_and_dashboard/achievement/achievement.dart';
import 'package:mostawak/features/stats_and_dashboard/progress_overview/progress_overview.dart';
import 'radar_triangle_widget.dart';

class StatsAndDashboard extends StatelessWidget {
  const StatsAndDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFECE7E3),
      appBar: AppBar(
        backgroundColor: MyColors.primary,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: MyColors.textColor),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: RichText(
          text: const TextSpan(
            children: [
              TextSpan(
                text: 'STATS',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: MyColors.shadowColor,
                  fontStyle: FontStyle.normal,
                  letterSpacing: 1.2,
                ),
              ),
              TextSpan(
                text: ' & ',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: MyColors.accentColor,
                  fontStyle: FontStyle.normal,
                ),
              ),
              TextSpan(
                text: 'DASHBOARD',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: MyColors.shadowColor,
                  fontStyle: FontStyle.normal,
                  letterSpacing: 1.2,
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 41, horizontal: 47),
          child: Column(
            children: [
              const Text(
                'Achievements',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Poppins',
                  color: Color(0xFFFFA62B),
                ),
              ),
              const SizedBox(height: 6),
              const RadarTriangleWidget(
                progress: 0.5,
                rank: 0.7,
                achievements: 1,
              ),
              const SizedBox(height: 7),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Rank',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                      color: Color(0xFFFFA62B),
                    ),
                  ),
                  Text(
                    'Progress',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                      color: Color(0xFFFFA62B),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 114),
              DashboardMenuItem(
                title: 'Progress',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ProgressOverviewPage(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 12),
              DashboardMenuItem(
                title: 'My Rank',
                onTap: () {},
              ),
              const SizedBox(height: 12),
              DashboardMenuItem(
                title: 'Achievements',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AchievementPage(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DashboardMenuItem extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const DashboardMenuItem({
    super.key,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 30,
            fontFamily: 'BigShoulders',
            color: Color(0xff16697B),
          ),
        ),
        IconButton(
          icon: const Icon(
            Icons.arrow_forward,
            color: Color(0xff16697B),
            size: 24,
          ),
          onPressed: onTap,
        ),
      ],
    );
  }
}
