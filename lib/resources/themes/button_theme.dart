import 'package:digital_wind_application/resources/themes/colors.dart';
import 'package:flutter/material.dart';

class AppButtonTheme {
  AppButtonTheme._();

  static ElevatedButtonThemeData lightElevatedButtonTheme =
      const ElevatedButtonThemeData(
          style: ButtonStyle(
    backgroundColor:
        MaterialStatePropertyAll<Color>(CustomColor.highlightLight),
  ));
  static ElevatedButtonThemeData darkElevatedButtonTheme =
      const ElevatedButtonThemeData(
          style: ButtonStyle(
    backgroundColor: MaterialStatePropertyAll<Color>(CustomColor.highlightDark),
  ));
}
