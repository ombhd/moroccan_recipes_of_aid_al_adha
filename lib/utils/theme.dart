import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:google_fonts_arabic/fonts.dart' show ArabicFonts;

final theme = ThemeData(
  scaffoldBackgroundColor: const Color(0xfff1f8e9),
  primaryColor: const Color(0xff689f38),
  primaryColorLight: const Color(0xfff1f8e9),
  primaryColorDark: const Color(0xff33691e),
  accentColor: const Color(0xffc5e1a5),
  backgroundColor: const Color(0xff689f38),
  textSelectionTheme: TextSelectionThemeData(selectionColor: Color(0xFFFBF5FF)),
  appBarTheme: AppBarTheme(
    elevation: 4,
    centerTitle: true,
    textTheme: TextTheme(
      headline6: TextStyle(
        fontFamily: ArabicFonts.Harmattan,
        package: 'google_fonts_arabic',
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: const Color(0xff689f38),
      ),
    ),
    backgroundColor: const Color(0xfff1f8e9),
    iconTheme: IconThemeData(color: const Color(0xff689f38)),
    actionsIconTheme: IconThemeData(color: const Color(0xff689f38)),
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
        primary: const Color(0xff689f38),
        backgroundColor: const Color(0xff689f38),
        textStyle: TextStyle(
          fontFamily: ArabicFonts.Harmattan,
          package: 'google_fonts_arabic',
          fontSize: 15,
          fontWeight: FontWeight.w500,
          color: const Color(0xffffffff),
        )),
  ),
  textTheme: TextTheme(
      headline6: TextStyle(
        fontFamily: ArabicFonts.Harmattan,
        package: 'google_fonts_arabic',
        fontSize: 25.0,
        fontWeight: FontWeight.bold,
        color: const Color(0xff689f38),
      ),
      headline5: TextStyle(
        fontFamily: ArabicFonts.Harmattan,
        package: 'google_fonts_arabic',
        fontSize: 26.0,
        fontWeight: FontWeight.bold,
        color: const Color(0xff689f38),
      ),
      headline4: TextStyle(
        fontFamily: ArabicFonts.Harmattan,
        package: 'google_fonts_arabic',
        fontSize: 21.5,
        fontWeight: FontWeight.bold,
        color: const Color(0xff689f38),
      ),
      headline3: TextStyle(
        fontFamily: ArabicFonts.Harmattan,
        package: 'google_fonts_arabic',
        fontSize: 20.0,
        // fontWeight: FontWeight.w600,

        color: const Color(0xff689f38),
      ),
      headline2: TextStyle(
        fontFamily: ArabicFonts.Harmattan,
        package: 'google_fonts_arabic',
        fontSize: 26,
        fontWeight: FontWeight.bold,
        color: const Color(0xFFE8D6FF),
      ),
      headline1: TextStyle(
        fontFamily: ArabicFonts.Harmattan,
        package: 'google_fonts_arabic',
        fontSize: 28,
        fontWeight: FontWeight.bold,
        color: const Color(0xFFE8D6FF),
      ),
      subtitle1: TextStyle(
        fontFamily: ArabicFonts.Harmattan,
        package: 'google_fonts_arabic',
        fontSize: 15,
        fontWeight: FontWeight.w500,
        color: const Color(0xFF000000),
      ),
      subtitle2: TextStyle(
        fontFamily: ArabicFonts.Harmattan,
        package: 'google_fonts_arabic',
        fontSize: 13,
        fontWeight: FontWeight.w500,
        color: const Color(0xFF404040),
      ),
      bodyText1: TextStyle(
        fontFamily: ArabicFonts.Harmattan,
        package: 'google_fonts_arabic',
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: const Color(0xFF000000),
      ),
      button: TextStyle(
        fontFamily: ArabicFonts.Harmattan,
        package: 'google_fonts_arabic',
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: const Color(0xff689f38),
      ),
      caption: TextStyle(
        fontFamily: ArabicFonts.Harmattan,
        package: 'google_fonts_arabic',
        fontSize: 17,
        // fontWeight: FontWeight.w700,
        color: const Color(0xFF000000),
      )),
);
