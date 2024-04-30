import 'package:digital_wind_application/resources/themes/button_theme.dart';
import 'package:digital_wind_application/resources/themes/color_sheme.dart';
import 'package:digital_wind_application/resources/themes/text_theme.dart';
import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    textTheme: AppTextTheme.lightTextTheme,
    elevatedButtonTheme: AppButtonTheme.lightElevatedButtonTheme,
    colorScheme: AppColorSheme.lightColorSheme,
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.dark,
    textTheme: AppTextTheme.darkTextTheme,
    colorScheme: AppColorSheme.darkColorScheme,
    elevatedButtonTheme: AppButtonTheme.darkElevatedButtonTheme,
  );
}
