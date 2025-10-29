import 'package:flutter/material.dart';
import 'package:mostawak/features/home/challenges/screens/action_area.dart';
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
    return Scaffold(
      backgroundColor: const Color(0xFFECE7E3),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            const Text(
              "Ready to learn something \n           new today ?",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF82C0CB)),
            ),
            const SizedBox(
              height: 30,
            ),
            ...List.generate(contentList.length, (index) {
              final Content = contentList[index];

              return ContentCards(
                title: Content.title,
                imagePath: Content.imagePath,
                isSelected: index == selectedIndex,
                onTap: () {
                  setState(() {
                    selectedIndex = index;
                  });
                },
              );
            }),
            const SizedBox(
              height: 40,
            ),
            actionArea(),
          ]),
        ),
      ),
    );
  }
}
