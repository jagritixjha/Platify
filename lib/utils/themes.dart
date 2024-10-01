import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Themes extends CupertinoThemeData {
  static CupertinoThemeData lightTheme = CupertinoThemeData.raw(
    Brightness.light,
    CupertinoColors.systemBlue,
    CupertinoColors.systemRed,
    CupertinoTextThemeData(
      textStyle: GoogleFonts.poppins(
        textStyle: const TextStyle(
          fontSize: 12,
          color: CupertinoColors.inactiveGray,
          fontWeight: FontWeight.w500,
        ),
      ),
      actionTextStyle: GoogleFonts.poppins(
        textStyle: const TextStyle(
          fontSize: 18,
          color: CupertinoColors.black,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
    CupertinoColors.white,
    CupertinoColors.white,
    true,
  );

  static CupertinoThemeData darkTheme = CupertinoThemeData.raw(
    Brightness.dark,
    CupertinoColors.systemBlue,
    CupertinoColors.systemRed,
    CupertinoTextThemeData(
      textStyle: GoogleFonts.poppins(
        textStyle: const TextStyle(
          fontSize: 12,
          color: CupertinoColors.inactiveGray,
          fontWeight: FontWeight.w500,
        ),
      ),
      actionTextStyle: GoogleFonts.poppins(
        textStyle: const TextStyle(
          fontSize: 18,
          color: CupertinoColors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
    CupertinoColors.darkBackgroundGray,
    CupertinoColors.darkBackgroundGray,
    true,
  );

  static ThemeData androidLightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.deepPurple,
    primarySwatch: Colors.pink,
    scaffoldBackgroundColor: Colors.white,
    textTheme: TextTheme(
      bodySmall: GoogleFonts.poppins(
        textStyle: const TextStyle(
          fontSize: 12,
          color: CupertinoColors.inactiveGray,
          fontWeight: FontWeight.w500,
        ),
      ),
      bodyMedium: GoogleFonts.poppins(
        textStyle: const TextStyle(
          fontSize: 18,
          color: Colors.black87,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
  );

  static ThemeData androidDarkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.deepPurple,
    primarySwatch: Colors.pink,
    scaffoldBackgroundColor: Colors.black87,
    textTheme: TextTheme(
      bodySmall: GoogleFonts.poppins(
        textStyle: const TextStyle(
          fontSize: 12,
          color: Colors.grey,
          fontWeight: FontWeight.w500,
        ),
      ),
      bodyMedium: GoogleFonts.poppins(
        textStyle: const TextStyle(
          fontSize: 18,
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
  );
}
