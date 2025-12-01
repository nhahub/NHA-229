import 'package:flutter/material.dart';

Widget buildTabBar() {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 50),
    child: const TabBar(
        labelColor: Color(0xFFFFA62B),
        unselectedLabelColor: Color(0xFF9E9E9E),
        tabs: [
          Tab(
            child: Text(
              "Ranked",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
          Text("|"),
          Tab(
            child: Text(
              "Unranked",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
        ]),
  );
}
