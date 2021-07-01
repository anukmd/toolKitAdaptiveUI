import 'dart:ui';
import 'package:flutter/material.dart';

/// ----  Blue Theme  ----
final bluePrimary = Color(0XFF363636);
final blueAccent = Color(0XFFed5a6b);
final blueBackground = Color(0xFFFFFFFF);
final blueTheme = ThemeData(

  primaryColor: bluePrimary,
  accentColor: blueAccent,
  backgroundColor: blueBackground,
  fontFamily: 'Metropolis',
  textTheme: TextTheme(
    bodyText1: TextStyle(color: Colors.white),
    bodyText2: TextStyle(color: Color(0XFF363636)), //grey
    headline4: TextStyle(
        color: Color(0XFF1c1c1c)), //light grey - stay black Color(0XFF1c1c1c)
    //button: TextStyle(color: Colors.white
    headline1: TextStyle(color: Colors.black, fontSize: 36),
    subtitle1: TextStyle(color: Colors.black, fontSize: 20),
    subtitle2: TextStyle(color: Colors.grey, fontSize: 16),
    overline: TextStyle(color: Colors.teal),
  ),
  //Distinct Test Colours
  // headline1: TextStyle(color: Colors.blue,fontSize: 36),
  // subtitle1: TextStyle(color: Colors.pink,fontSize: 20),
  // subtitle2: TextStyle(color: Colors.yellow,fontSize: 16),
  // bodyText1: TextStyle(color: Colors.purple),
  // bodyText2: TextStyle(color: Colors.grey),
  //Zomato Colours
);

/// ----  Protanopia Theme  ----
final proPrimary = Color(0xFFAE9C45);
final proAccent = Color(0xFF6073B1);
final proBackground = Color(0xFFA7B8F8);
final proTheme = ThemeData(
    primaryColor: proPrimary,
    accentColor: proAccent,
    backgroundColor: proBackground,
    fontFamily: 'Metropolis',
    textTheme: TextTheme(
      bodyText1: TextStyle(color: Colors.white),
      bodyText2: TextStyle(color: Colors.white),
      headline4: TextStyle(color: Color(0XFF1c1c1c)),
      headline1: TextStyle(color: Colors.black, fontSize: 36),
      subtitle1: TextStyle(color: Colors.white, fontSize: 20),
      subtitle2: TextStyle(color: Colors.white, fontSize: 16),
      overline: TextStyle(color: Colors.white),
    ));

/// ----  Deuteranopia Theme  ----
final deutPrimary = Color(0xFFC59434);
final deutAccent = Color(0xFF6F7498);
final deutBackground = Color(0xFFA3B7F9);
final deutTheme = ThemeData(
    primaryColor: deutPrimary,
    accentColor: deutAccent,
    backgroundColor: deutBackground,
    fontFamily: 'Metropolis',
    textTheme: TextTheme(
      bodyText1: TextStyle(color: Colors.white),
      bodyText2: TextStyle(color: Colors.white),
      headline4: TextStyle(color: Color(0XFF1c1c1c)),
      headline1: TextStyle(color: Colors.black, fontSize: 36),
      subtitle1: TextStyle(color: Colors.white, fontSize: 20),
      subtitle2: TextStyle(color: Colors.white, fontSize: 16),
      overline: TextStyle(color: Colors.white),
    ));

/// ----  Tritanopia Theme  ----
final triPrimary = Color(0xFFF48080);
final triAccent = Color(0xFFFFDCDC);
final triBackground = Color(0xFF2D676F);
final triTheme = ThemeData(
    primaryColor: triPrimary,
    accentColor: triAccent,
    backgroundColor: triBackground,
    fontFamily: 'Metropolis',
    textTheme: TextTheme(
      bodyText1: TextStyle(color: Colors.white),
      bodyText2: TextStyle(color: Colors.white),
      headline4: TextStyle(color: Color(0XFF1c1c1c)),
      headline1: TextStyle(color: Colors.black, fontSize: 36),
      subtitle1: TextStyle(color: Colors.white, fontSize: 20),
      subtitle2: TextStyle(color: Colors.white, fontSize: 16),
      overline: TextStyle(color: Colors.white),
    ));

/// ----  Monochromacy Theme  ----
final monoPrimary = Color(0xFF6D4F57);
final monoAccent = Color(0xFF563E45);
final monoBackground = Color(0xFF402E33);
final monoTheme = ThemeData(
    primaryColor: monoPrimary,
    accentColor: monoAccent,
    backgroundColor: monoBackground,
    fontFamily: 'Metropolis',
    textTheme: TextTheme(
      bodyText1: TextStyle(color: Colors.white),
      bodyText2: TextStyle(color: Colors.white),
      headline4: TextStyle(color: Color(0XFF1c1c1c)),
      headline1: TextStyle(color: Colors.black, fontSize: 36),
      subtitle1: TextStyle(color: Colors.white, fontSize: 20),
      subtitle2: TextStyle(color: Colors.white, fontSize: 16),
      overline: TextStyle(color: Colors.white),
    ));
