import 'package:digital_wind_application/resources/themes/colors.dart';
import 'package:flutter/material.dart';

class AppColorSheme {
  AppColorSheme._();

  static ColorScheme lightColorSheme = ColorScheme(
    brightness: Brightness.light,
    background: CustomColor.primaryLight,
    onBackground: const ColorScheme.light().onBackground,
    primary: CustomColor.highlightLight,
    onPrimary: const ColorScheme.light().onPrimary,
    secondary: CustomColor.secondaryLight,
    onSecondary: const ColorScheme.light().onSecondary,
    surface: const ColorScheme.light().surface,
    onSurface: const ColorScheme.light().onSurface,
    error: CustomColor.errorLight,
    onError: const ColorScheme.light().onError,
  );
  static ColorScheme darkColorScheme = ColorScheme(
    brightness: Brightness.dark,
    background: CustomColor.primaryDark,
    onBackground: const ColorScheme.dark().onBackground,
    primary: CustomColor.highlightDark,
    onPrimary: const ColorScheme.dark().onPrimary,
    secondary: CustomColor.secondaryDark,
    onSecondary: const ColorScheme.dark().onSecondary,
    surface: const ColorScheme.dark().surface,
    onSurface: const ColorScheme.dark().onSurface,
    error: CustomColor.errorDark,
    onError: const ColorScheme.dark().onError,
  );
}
