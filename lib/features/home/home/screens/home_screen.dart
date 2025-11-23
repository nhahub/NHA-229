import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mostawak/core/constants/app_assets.dart';
import 'package:mostawak/core/constants/app_colors.dart';
import 'package:mostawak/features/home/learn/screens/learn_screen.dart';
import 'package:mostawak/features/home/shop/screens/reward_screen.dart';
import 'package:mostawak/features/stats_and_dashboard/stats_and_dashboard.dart';

import '../../ai/screens/chat_screen.dart';
import '../widgets/feature_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(top: 10.h),
        child: Column(
          children: [
            FeatureCard(
              imageUrl: AppAssets.bookIcon,
              title:
                  'Start Learning with Mostawak! 📚\nDiscover interactive lessons and practical exercises that guide you step by step, helping you build skills and stay motivated on your journey',
              buttonText: 'Start Learning',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LearnScreen()),
                );
              },
            ),
            FeatureCard(
              title: 'Zero to Hero',
              subtitle:
                  'Start from zero and level up your skills step by step. Complete daily tasks, earn points, unlock ranks, and become the hero of your learning journey!',
              buttonText: 'Challenges',
              onPressed: () {},
            ),
            FeatureCard(
              imageUrl: AppAssets.itemShop,
              title:
                  'Explore and unlock extra features that enhance your experience! From advanced learning tools to exclusive content and rewards, everything you need is at your fingertips to get the most out of the app.',
              buttonText: 'Item Shop',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const RewardScreen()),
                );
              },
            ),
            FeatureCard(
              imageUrl: AppAssets.statistics,
              title:
                  ' Track your progress and performance all in one place! Get clear insights, see your achievements, and stay motivated with real-time statistics and an interactive dashboard.',
              buttonText: 'Stats & Dashboard',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const StatsAndDashboard()),
                );
              },
            ),
            FeatureCard(
              // imageUrl: AppAssets.robotIcon,
              title: 'Chat with AI – Learn Smarter',
              titleColor: MyColors.accentColor,
              subtitle:
                  'Discuss your lessons, fix your mistakes, and improve step by step. Your AI tutor is here to guide you from Zero to Hero!',
              buttonText: 'Chat With AI',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ChatScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
