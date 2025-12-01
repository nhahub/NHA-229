import 'package:flutter/material.dart';
import 'package:mostawak/generated/l10n.dart';

Widget actionArea({required void Function() onPressed}) {
  return Padding(
    padding: const EdgeInsets.only(left: 20, right: 20, bottom: 30, top: 20),
    child: SizedBox(
      width: double.infinity,
      height: 60,
      child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            elevation: 5,
            backgroundColor: const Color(0xFFFFA62B),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          child: Text(S.current.ready,
              style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Bangers',
                  color: Colors.white))),
    ),
  );
}
