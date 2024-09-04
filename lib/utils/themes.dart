import 'package:flutter/cupertino.dart';
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
    CupertinoColors.black,
    CupertinoColors.black,
    true,
  );
}
