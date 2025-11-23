import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mostawak/core/constants/app_colors.dart';

import '../../challenges/screens/coming_soon.dart';
import '../../challenges/screens/english_challenge_room.dart';
import 'content_cards.dart';

class Content {
  final String title;
  final String imagePath;

  Content(this.title, this.imagePath);
}

final List<Content> contentList = [
  Content('Science', 'assets/images/Science.svg'),
  Content('Programming', 'assets/images/Programming.svg'),
  Content('English', 'assets/images/English.svg'),
  Content('Mathematics', 'assets/images/Mathematics.svg'),
];

class LearnScreen extends StatefulWidget {
  const LearnScreen({super.key});

  @override
  State<LearnScreen> createState() => _LearnScreenState();
}

class _LearnScreenState extends State<LearnScreen> {
  int selectedIndex = -1;

  void _navigateToSelected(String title) {
    if (title == "English") {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const EnglishChallengeRoomScreen(),
        ),
      );
    } else if (title == "Science" ||
        title == "Programming" ||
        title == "Mathematics") {
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Ready to learn something \n           new today ?",
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
        "Start Learning",
        style: TextStyle(fontSize: 20.sp, color: Colors.white),
      ),
    );
  }
}
