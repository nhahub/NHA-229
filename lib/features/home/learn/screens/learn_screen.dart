import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mostawak/core/constants/app_colors.dart';
import 'package:mostawak/features/settings/controllers/language_controller.dart';
import 'package:mostawak/generated/l10n.dart';

import '../../challenges/screens/coming_soon.dart';
import '../../challenges/screens/english_challenge_room.dart';
import 'content_cards.dart';

class Content {
  final String title;
  final String imagePath;

  Content(this.title, this.imagePath);
}

class LearnScreen extends StatefulWidget {
  const LearnScreen({super.key});

  @override
  State<LearnScreen> createState() => _LearnScreenState();
}

class _LearnScreenState extends State<LearnScreen> {
  int selectedIndex = -1;

  void _navigateToSelected(String title) {
    if (title == S.current.english) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const EnglishChallengeRoomScreen(),
        ),
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const ComingSoonScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 1,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            child: BlocBuilder<LanguageController, String>(
              builder: (context, state) {
                final List<Content> contentList = [
                  Content(S.current.science, 'assets/images/Science.svg'),
                  Content(
                      S.current.programming, 'assets/images/Programming.svg'),
                  Content(S.current.english, 'assets/images/English.svg'),
                  Content(S.current.math, 'assets/images/Mathematics.svg'),
                ];
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      S.current.readyToLearn,
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w400,
                        color: MyColors.iconColor,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 25.h),

                    // Cards
                    ...List.generate(contentList.length, (index) {
                      final content = contentList[index];
                      final isSelected = index == selectedIndex;

                      return ContentCards(
                        title: content.title,
                        imagePath: content.imagePath,
                        isSelected: isSelected,
                        onTap: () {
                          setState(() => selectedIndex = index);
                          _navigateToSelected(content.title);
                        },
                      );
                    }),

                    SizedBox(height: 20.h),
                    actionArea(),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget actionArea() {
    return ElevatedButton(
      onPressed: selectedIndex != -1
          ? () => _navigateToSelected(contentList[selectedIndex].title)
          : null,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF16697B),
        padding: EdgeInsets.symmetric(horizontal: 50.w, vertical: 15.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.r),
        ),
      ),
      child: Text(
        S.current.startLearning,
        style: TextStyle(fontSize: 20.sp, color: Colors.white),
      ),
    );
  }
}
