import 'package:flutter/material.dart';
import 'package:mostawak/features/home/challenges/widgets/reusable_appbar.dart';
import 'beginner_challenge_room.dart';
import 'intermediate_challenge_room.dart';
import 'paragraph_reading.dart';

class Content {
  final String title;
  Content(this.title);
}

final List<Content> contentList = [
  Content('Beginner'),
  Content('Intermediate'),
  Content('Advanced'),
];

class EnglishChallengeRoomScreen extends StatefulWidget {
  const EnglishChallengeRoomScreen({super.key});

  @override
  State<EnglishChallengeRoomScreen> createState() =>
      _EnglishChallengeRoomScreenState();
}

class _EnglishChallengeRoomScreenState
    extends State<EnglishChallengeRoomScreen> {
  int selectedIndex = -1;

  void _navigateToSelected(BuildContext context) {
    if (selectedIndex == -1) return;

    final selectedTitle = contentList[selectedIndex].title;

    if (selectedTitle == "Beginner") {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const BeginnerChallengeRoomScreen()),
      );
    } else if (selectedTitle == "Intermediate") {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (_) => const IntermediateChallengeRoomScreen()),
      );
    } else if (selectedTitle == "Advanced") {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const ReadingParagraphScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ReusableAppBar(
        centerImage: 'assets/images/challenge ROOM.svg',
        showTabs: false,
      ),
      backgroundColor: const Color(0xFFECE7E3),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "English Challenge Room",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF16697B),
                ),
              ),
              const SizedBox(height: 30),
              Expanded(
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: contentList.length,
                  itemBuilder: (context, index) {
                    final content = contentList[index];
                    final bool isSelected = index == selectedIndex;

                    return AnimatedContainer(
                      duration: const Duration(milliseconds: 250),
                      curve: Curves.easeOut,
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                        color: const Color(0xFF82C0CB),
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(
                          color: isSelected
                              ? const Color(0xFFFE9C04)
                              : const Color(0xFF16697B),
                          width: 3,
                        ),
                        boxShadow: [
                          if (isSelected)
                            const BoxShadow(
                              color: Colors.black26,
                              blurRadius: 10,
                              offset: Offset(0, 5),
                            ),
                        ],
                      ),
                      child: ListTile(
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 30,
                          vertical: 20,
                        ),
                        title: Center(
                          child: Text(
                            content.title,
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFFECE7E3),
                            ),
                          ),
                        ),
                        onTap: () {
                          setState(() => selectedIndex = index);
                        },
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
              AnimatedOpacity(
                duration: const Duration(milliseconds: 300),
                opacity: selectedIndex != -1 ? 1 : 0.5,
                child: ElevatedButton(
                  onPressed: selectedIndex != -1
                      ? () => _navigateToSelected(context)
                      : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF16697B),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 60,
                      vertical: 18,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    elevation: 5,
                  ),
                  child: const Text(
                    "Start Learning",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
