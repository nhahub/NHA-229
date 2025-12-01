import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mostawak/core/constants/app_assets.dart';
import 'package:mostawak/core/constants/app_colors.dart';
import 'package:mostawak/features/home/learn/screens/learn_screen.dart';
import 'package:mostawak/features/home/shop/screens/reward_screen.dart';
import 'package:mostawak/features/settings/controllers/language_controller.dart';
import 'package:mostawak/features/stats_and_dashboard/stats_and_dashboard.dart';
import 'package:mostawak/generated/l10n.dart';

import '../../ai/screens/chat_screen.dart';
import '../widgets/feature_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(top: 10.h),
        child: BlocBuilder<LanguageController, String>(
          builder: (context, state) {
            return Column(
              children: [
                FeatureCard(
                  imageUrl: AppAssets.bookIcon,
                  title: S.current.learnCardContent,
                  buttonText: S.current.startLearning,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LearnScreen()),
                    );
                  },
                ),
                FeatureCard(
                  title: S.current.zeroToHero,
                  subtitle: S.current.challengeCardContent,
                  buttonText: S.current.challenges,
                  onPressed: () {},
                ),
                FeatureCard(
                  imageUrl: AppAssets.itemShop,
                  title: S.current.itemShopCardContent,
                  buttonText: S.current.itemShop,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const RewardScreen()),
                    );
                  },
                ),
                FeatureCard(
                  imageUrl: AppAssets.statistics,
                  title: S.current.statsCardContent,
                  buttonText: S.current.statsDashboard,
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
                  title: "${S.current.chatWithAI} - ${S.current.learnSmarter}",
                  titleColor: MyColors.accentColor,
                  subtitle: S.current.chatCardContent,
                  buttonText: S.current.chat,
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
            );
          },
        ),
      ),
    );
  }
}
