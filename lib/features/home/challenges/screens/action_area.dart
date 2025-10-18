import 'package:flutter/material.dart';

Widget actionArea() {
  return Padding(
    padding: const EdgeInsets.only(left: 20, right: 20, bottom: 30, top: 20),
    child: Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: 60,
          child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                elevation: 5,
                backgroundColor: const Color(0xFFFFA62B),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: const Text("READY!",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Bangers',
                      color: Colors.white))),
        ),
        const SizedBox(height: 10),
        const Padding(
          padding: const EdgeInsets.only(left: 150),
          child: const Text(

            "training | Play offline",
            style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.normal,
                color: Color(0xFF9E9E9E)),
          ),
        )
      ],
    ),
  );
}
