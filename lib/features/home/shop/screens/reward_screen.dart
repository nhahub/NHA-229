import 'package:flutter/material.dart';
import 'package:mostawak/core/constants/app_colors.dart';
import '../../challenges/widgets/reusable_appbar.dart';
import '../widgets/info_card.dart';

class RewardScreen extends StatelessWidget {
  const RewardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ReusableAppBar(
        centerImage: 'assets/images/shop_title.svg',
        showTabs: false,
      ),
      backgroundColor: const Color(0xfff6f6f6),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: const Text(
                  "Use your points to unlock cool rewards and power-ups.",
                  style: TextStyle(color: Colors.grey, fontSize: 14),
                ),
              ),
              const SizedBox(height: 8),
              const Row(
                children: [
                  Icon(Icons.monetization_on, color: Colors.amber, size: 20),
                  SizedBox(width: 4),
                  Text(
                    "Your Balance: ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: MyColors.primary,
                    ),
                  ),
                  Text(
                    " 97 points",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.amber,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // 🔹 First Card
              InfoCard(
                title1: "Mostawak hero avatar",
                titleStyle: TextStyle(fontSize: 12, color: Colors.white),
                value1: "Epic",
                title2:
                    "A heroic style — sharp, \ndetermined, and full of energy",
                imagePath2: "assets/images/avatar.png",
                title3: "75",
                imagePath3: "assets/images/coin.png",
                buttonText: "Unlock",
                onButtonPressed: () => print("Hero avatar unlocked!"),
                buttonColor: const Color(0xff16697B),
                buttonTextColor: Colors.white,
                cardColor: const Color(0xff489EB5),
              ),

              // 🔹 Second Card
              InfoCard(
                title1: "Black and white theme",
                value1: "common",
                title2:
                    "A clean black-and-white theme — minimal, \nelegant, and timeless.",
                imagePath2: null,
                title3: "25",
                imagePath3: "assets/images/coin.png",
                buttonText: "Unlock",
                onButtonPressed: () => print("Theme unlocked!"),
                buttonColor: Colors.black,
                buttonTextColor: Colors.white,
                cardColor: Colors.white,
              ),

              // 🔹 Third Card
              InfoCard(
                title1: "Double XP Weekend",
                titleStyle: TextStyle(fontSize: 12, color: Colors.white),
                value1: "common",
                title2:
                    "Get 2x points for completing levels for \nthe next 7 days",
                imagePath2: null,
                title3: "35",
                imagePath3: "assets/images/coin.png",
                buttonText: "Unlock",
                onButtonPressed: () => print("Double XP unlocked!"),
                buttonColor: const Color(0xff16697B),
                buttonTextColor: Colors.white,
                cardColor: const Color(0xff489EB5),
              ),

              // 🔹 Fourth Card
              InfoCard(
                title1: "3x XP Weekend",
                titleStyle: TextStyle(fontSize: 12, color: Colors.white),
                value1: "common",
                title2:
                    "Get 3x points for completing levels for \nthe next 7 days",
                imagePath2: null,
                title3: "45",
                imagePath3: "assets/images/coin.png",
                buttonText: "Unlock",
                onButtonPressed: () => print("3x XP unlocked!"),
                buttonColor: const Color(0xff16697B),
                buttonTextColor: Colors.white,
                cardColor: const Color(0xff489EB5),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
