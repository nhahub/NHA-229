import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mostawak/core/constants/app_colors.dart';
import 'package:mostawak/features/home/challenges/screens/action_area.dart';
import 'package:mostawak/core/widgets/custom_drawer.dart';

import 'package:mostawak/features/home/home/widgets/custom_app_bar.dart';
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

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 1, 
      child: Scaffold(
        backgroundColor: const Color(0xFFECE7E3),
        drawer: const CustomDrawer(),
        appBar: const CustomAppBarWithTabs(), 
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Ready to learn something \n           new today ?",
                  style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w400,
                      color: MyColors.iconColor),
                ),
                SizedBox(
                  height: 25.h,
                ),
                ...List.generate(contentList.length, (index) {
                  final content = contentList[index];

                  return ContentCards(
                    title: content.title,
                    imagePath: content.imagePath,
                    isSelected: index == selectedIndex,
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                  );
                }),
                SizedBox(
                  height: 10.h,
                ),
                actionArea(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}