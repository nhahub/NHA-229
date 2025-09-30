import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LightTheme {
  static const mainColor = Color(0xff16697B);
  static const secondaryColor = Color(0xffFFA62B);

  static ThemeData theme(Locale lang) => ThemeData(
        primaryColor: mainColor,
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: mainColor,
          primary: mainColor,
          surface: const Color(0xffece7e3),
        ),
        elevatedButtonTheme: const ElevatedButtonThemeData(
            style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(mainColor),
          foregroundColor: WidgetStatePropertyAll(
            Color(0xffffffff),
          ),
          shape: WidgetStatePropertyAll(RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)),
          )),
          minimumSize: WidgetStatePropertyAll(Size(double.infinity, 50)),
        )),
        textButtonTheme: const TextButtonThemeData(
            style: ButtonStyle(
          padding: WidgetStatePropertyAll(EdgeInsets.all(5)),
          textStyle: WidgetStatePropertyAll(TextStyle(
            color: secondaryColor,
            fontSize: 12,
          )),
        )),
        textTheme: TextTheme(
          displayLarge: lang.toString() == 'en'
              ? GoogleFonts.bigShouldersText(
                  fontSize: 40,
                  fontWeight: FontWeight.normal,
                  color: mainColor,
                )
              : GoogleFonts.changa(
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                  color: mainColor,
                ),
          bodySmall: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.normal,
            color: const Color(0xff9e9e9e),
          ),
          bodyMedium: GoogleFonts.poppins(
            // for the email highlighting in forgot pass 2
            fontSize: 16,
            fontWeight: FontWeight.normal,
            color: const Color(0xff000000),
          ),
        ),
      );
}
