import 'package:digital_wind_application/resources/themes/colors.dart';
import 'package:flutter/material.dart';

class AppColorSheme {
  AppColorSheme._();

  static ColorScheme lightColorSheme = const ColorScheme(
    brightness: Brightness.light,
    primary: CustomColor.primaryLight,
    secondary: CustomColor.secondaryLight,
    onPrimary: CustomColor.highlightLight,
    tertiary: CustomColor.textLight,
    onTertiary: CustomColor.subTextLight,
    onSecondary: CustomColor.dopLight,
    error: CustomColor.errorLight,
    surface: CustomColor.primaryLight,
    onSurface: Colors.black,
    background: CustomColor.primaryLight,
    onBackground: Colors.black,
    onError: CustomColor.errorLight,
  );
  static ColorScheme darkColorScheme = const ColorScheme(
    brightness: Brightness.dark,
    primary: CustomColor.primaryDark,
    secondary: CustomColor.secondaryDark,
    onPrimary: CustomColor.highlightDark,
    tertiary: CustomColor.textDark,
    onTertiary: CustomColor.subTextDark,
    onSecondary: CustomColor.dopDark,
    error: CustomColor.errorDark,
    surface: CustomColor.primaryDark,
    onSurface: Colors.white,
    background: CustomColor.primaryDark,
    onBackground: Colors.white,
    onError: CustomColor.errorDark,
  );
}
