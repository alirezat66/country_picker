import 'package:flutter/material.dart';

final lifetapTheme = ThemeData(
  textTheme: const TextTheme(
    headline4: TextStyle(
      fontSize: 21,
      fontWeight: FontWeight.w900,
      fontFamily: 'Avenir',
    ),
    headline5: TextStyle(
      fontSize: 21,
      fontWeight: FontWeight.w500,
      fontFamily: 'Avenir',
    ),
    bodyText2: TextStyle(
        fontSize: 19,
        fontWeight: FontWeight.w400,
        color: Colors.white,
        fontFamily: 'sfPro'),
    bodyText1: TextStyle(
        fontSize: 23,
        fontWeight: FontWeight.w400,
        color: Colors.white,
        fontFamily: 'sfPro'),
    subtitle1: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: Colors.white,
        fontFamily: 'sfPro'),
  ),
  appBarTheme: const AppBarTheme(
      elevation: 0,
      centerTitle: false,
      titleTextStyle: TextStyle(
          fontSize: 21,
          height: 1.4,
          fontWeight: FontWeight.w900,
          color: Colors.white)),
  colorScheme: const ColorScheme(
      primary: Color(0xff140514),
      primaryVariant: Colors.amber,
      secondary: Colors.blue,
      secondaryVariant: Colors.white,
      surface: Color(0xff212531),
      background: Colors.cyan,
      error: Colors.brown,
      onPrimary: Colors.yellowAccent,
      onSecondary: Colors.green,
      onSurface: Colors.white,
      onBackground: Colors.indigo,
      onError: Colors.pink,
      brightness: Brightness.dark),
  primarySwatch: Colors.blue,
  scaffoldBackgroundColor: const Color(0xff212531),
  inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
      filled: true,
      fillColor: const Color(0xff767680).withOpacity(0.24),
      prefixIconColor: const Color(0xffA1A1A4).withOpacity(0.60),
      hintStyle: TextStyle(
        fontFamily: 'sfPro',
        color: const Color(0xffEBEBF5).withOpacity(0.60),
        fontSize: 17,
      ),
      alignLabelWithHint: false,
      contentPadding: EdgeInsets.zero),
);
