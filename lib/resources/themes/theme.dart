import 'package:digital_wind_application/resources/themes/colors.dart';
import 'package:digital_wind_application/resources/themes/text_theme.dart';
import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static ThemeData lightTheme = ThemeData(
      useMaterial3: true,
      fontFamily: 'Poppins',
      brightness: Brightness.light,
      primaryColor: CustomColor.primaryLight,
      scaffoldBackgroundColor: CustomColor.primaryLight,
      textTheme: AppTextTheme.lightTextTheme,
      highlightColor: CustomColor.highlightLight,
      dialogBackgroundColor: CustomColor.secondaryLight);

  static ThemeData darkTheme = ThemeData(
      useMaterial3: true,
      fontFamily: 'Poppins',
      brightness: Brightness.dark,
      primaryColor: CustomColor.primaryDark,
      scaffoldBackgroundColor: CustomColor.primaryDark,
      textTheme: AppTextTheme.darkTextTheme,
      highlightColor: CustomColor.highlightDark,
      dialogBackgroundColor: CustomColor.secondaryDark);
}
