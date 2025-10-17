import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChallengesScreen extends StatelessWidget {
  const ChallengesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      margin: const EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Row(
              children: [
                const Column(
                  children: [
                    Text(
                      "My Rank",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      "Keep pushing forward! Every \n challenge brings you closer to \n the top",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.normal,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 11),
                Column(
                  children: [
                    SvgPicture.asset(
                      "assets/images/challenge_icon.svg",
                      width: 109,
                      height: 91,
                    ),
                    // const SizedBox(height: 4),
                    const Text(
                      "Plat V",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF82C0CB),
              ),
              child: Row(
                children: [
                  const Text(
                    "My Stats",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF16697B),
                    ),
                  ),
                  const Spacer(),
                  SvgPicture.asset("assets/images/arrow_forward.svg"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
