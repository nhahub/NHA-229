import 'package:flutter/material.dart';

Widget gridWidget() {
  final List<int> items = List.generate(6, (index) => index);
  return GridView.builder(
    shrinkWrap: true,
    padding: const EdgeInsets.symmetric(horizontal: 20.0),
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 3,
      childAspectRatio: 1.0,
      crossAxisSpacing: 15.0,
      mainAxisSpacing: 15.0,
    ),
    itemCount: items.length,
    itemBuilder: (context, index) {
      final bool isSelected = index == 0;

      return Container(
        decoration: BoxDecoration(
          color: const Color(0xFF82C0CB),
          borderRadius: BorderRadius.circular(10),
          border: isSelected
              ? Border.all(color: const Color(0xFFFE9C04), width: 3.0)
              : null,
        ),
      );
    },
  );
}
