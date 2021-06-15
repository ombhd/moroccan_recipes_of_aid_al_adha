import 'package:flutter/material.dart';

final theme = ThemeData(
  scaffoldBackgroundColor: const Color(0xfffff8f2),
  primaryColor: const Color(0xffff6a07),
  primaryColorLight: const Color(0xfffff3e0),
  primaryColorDark: const Color(0xff000000),
  accentColor: const Color(0xfffff3e0),
  backgroundColor: const Color(0xffff6a07),
  textSelectionTheme: TextSelectionThemeData(selectionColor: Color(0xFFFBF5FF)),
  appBarTheme: AppBarTheme(
    elevation: 4,
    centerTitle: true,
    textTheme: TextTheme(
      headline6: TextStyle(
        fontFamily: 'QuickSand',
        fontSize: 17,
        fontWeight: FontWeight.bold,
        color: const Color(0xffff6a07),
      ),
    ),
    backgroundColor: const Color(0xfffff8f2),
    iconTheme: IconThemeData(color: const Color(0xffff6a07)),
    actionsIconTheme: IconThemeData(color: const Color(0xffff6a07)),
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
        primary: const Color(0xffff6a07),
        backgroundColor: const Color(0xffff6a07),
        textStyle: TextStyle(
          fontFamily: 'QuickSand',
          fontSize: 15,
          fontWeight: FontWeight.w500,
          color: const Color(0xffffffff),
        )),
  ),
  textTheme: TextTheme(
      headline6: TextStyle(
        fontFamily: 'QuickSand',
        fontSize: 15,
        fontWeight: FontWeight.bold,
        color: const Color(0xffff6a07),
      ),
      headline5: TextStyle(
        fontFamily: 'QuickSand',
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: const Color(0xffff6a07),
      ),
      headline4: TextStyle(
        fontFamily: 'QuickSand',
        fontSize: 19.5,
        fontWeight: FontWeight.bold,
        color: const Color(0xffff6a07),
      ),

      // headline3 is reserved for sidebar menu items, don't use it for something else
      headline3: TextStyle(
        fontFamily: 'QuickSand',
        fontSize: 17,
        fontWeight: FontWeight.w600,
        color: const Color(0xFFE8D6FF),
      ),
      headline2: TextStyle(
        fontFamily: 'QuickSand',
        fontSize: 26,
        fontWeight: FontWeight.bold,
        color: const Color(0xFFE8D6FF),
      ),
      headline1: TextStyle(
        fontFamily: 'QuickSand',
        fontSize: 28,
        fontWeight: FontWeight.bold,
        color: const Color(0xFFE8D6FF),
      ),
      subtitle1: TextStyle(
        fontFamily: 'QuickSand',
        fontSize: 15,
        fontWeight: FontWeight.w500,
        color: const Color(0xFF000000),
      ),
      subtitle2: TextStyle(
        fontFamily: 'QuickSand',
        fontSize: 13,
        fontWeight: FontWeight.w500,
        color: const Color(0xFF404040),
      ),
      bodyText1: TextStyle(
        fontFamily: 'QuickSand',
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: const Color(0xFF000000),
      ),
      button: TextStyle(
        fontFamily: 'QuickSand',
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: const Color(0xffff6a07),
      ),
      caption: TextStyle(
        fontFamily: 'QuickSand',
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: const Color(0xFF000000),
      )),
);
