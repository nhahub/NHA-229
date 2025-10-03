import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final double fontSize;
  final double width;
  final double height;
  final VoidCallback onPressed;

  const CustomButton({
    super.key,
    required this.text,
    this.fontSize = 23,
    this.width = 200,
    this.height = 49,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF16697B),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontFamily: 'BebasNeue',
            fontSize: fontSize,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
