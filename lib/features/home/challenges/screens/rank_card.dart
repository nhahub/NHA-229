import 'package:flutter/material.dart';

class RankCard extends StatelessWidget {
  final String rankText;
  final Widget rankIcon;
  final VoidCallback onButtonPressed;

  final String title = 'My Rank';
  final String description =
      'Keep pushing forward! Every challenge brings you closer to the top';
  final Color backgroundColor = const Color(0xFF16697B);

  const RankCard({
    super.key,
    required this.rankText,
    required this.rankIcon,
    required this.onButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 220,

      //margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    //const SizedBox(height: 2),
                    Text(
                      description,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.normal,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 55,
              ),
              Column(
                children: [
                  rankIcon,
                  //const SizedBox(height: 4),
                  Text(
                    rankText,
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const Spacer(),
          SizedBox(
            width: double.infinity,
            height: 45.0,
            child: InkWell(
              onTap: onButtonPressed,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFF82C0CB),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: const Row(
                  children: <Widget>[
                    Text(
                      "My Stats",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF16697B),
                      ),
                    ),
                    Spacer(),
                    Icon(Icons.arrow_forward, color: Color(0xFF16697B)),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
