import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'action_area.dart';
import 'grid_widget.dart';
import 'rank_card.dart';

class ChallengesScreen extends StatelessWidget {
  const ChallengesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            RankCard(
                rankText: "plat V",
                rankIcon: SvgPicture.asset("assets/images/challenge_icon.svg"),
                onButtonPressed: () {}),
            const SizedBox(height: 10),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Ranked",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.normal,
                      color: Color(0xFF9E9E9E)),
                ),
                SizedBox(width: 20),
                Text(
                  "|",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.normal,
                      color: Color(0xFF9E9E9E)),
                ),
                SizedBox(width: 20),
                Text(
                  "Unranked",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.normal,
                      color: Color(0xFF9E9E9E)),
                ),
              ],
            ),
            const SizedBox(height: 20),

            gridWidget(),

            // CustomButton(
            //   text: 'Ready !',
            //   onPressed: () {},
            //   hPadding: false,
            // )
            actionArea(),
          ],
        ),
      ),
    );
  }
}
