import 'package:digital_wind_application/resources/themes/colors.dart';
import 'package:flutter/material.dart';

class AppTextTheme {
  AppTextTheme._();

  static TextTheme lightTextTheme = TextTheme(
    displayLarge: const TextStyle().copyWith(
        // Главное название приложения
        fontSize: 57.0,
        fontWeight: FontWeight.bold,
        color: CustomColor.highlightLight),
    displayMedium: const TextStyle().copyWith(
        // Название приложения
        fontSize: 45.0,
        fontWeight: FontWeight.bold,
        color: CustomColor.highlightLight),
    displaySmall: const TextStyle().copyWith(
        // Название приложения в информации о приложении
        fontSize: 36.0,
        fontWeight: FontWeight.bold,
        color: CustomColor.highlightLight),
    labelLarge: const TextStyle().copyWith(
        // Текст кнопки
        fontSize: 14.0,
        fontWeight: FontWeight.bold,
        color: CustomColor.buttonTextLight),
    labelMedium: const TextStyle().copyWith(
        // Lable
        fontSize: 12.0,
        fontWeight: FontWeight.bold,
        color: CustomColor.textLight),
    labelSmall: const TextStyle().copyWith(
        // SubLable
        fontSize: 11.0,
        fontWeight: FontWeight.bold,
        color: CustomColor.subTextLight),
    headlineLarge: const TextStyle().copyWith(
        fontSize: 32.0,
        fontWeight: FontWeight.bold,
        color: CustomColor.highlightLight),
    headlineMedium: const TextStyle().copyWith(
        fontSize: 28.0,
        fontWeight: FontWeight.bold,
        color: CustomColor.highlightLight),
    headlineSmall: const TextStyle().copyWith(
        fontSize: 24.0,
        fontWeight: FontWeight.bold,
        color: CustomColor.highlightLight),
    bodyLarge: const TextStyle().copyWith(
        fontSize: 16.0,
        fontWeight: FontWeight.bold,
        color: CustomColor.textLight),
    bodyMedium: const TextStyle().copyWith(
        fontSize: 14.0,
        fontWeight: FontWeight.bold,
        color: CustomColor.textLight),
    bodySmall: const TextStyle().copyWith(
        fontSize: 12.0,
        fontWeight: FontWeight.bold,
        color: CustomColor.textLight),
  );
  static TextTheme darkTextTheme = TextTheme(
    displayLarge: const TextStyle().copyWith(
        // Главное название приложения
        fontSize: 57.0,
        fontWeight: FontWeight.bold,
        color: CustomColor.highlightDark),
    displayMedium: const TextStyle().copyWith(
        // Название приложения
        fontSize: 45.0,
        fontWeight: FontWeight.bold,
        color: CustomColor.highlightDark),
    displaySmall: const TextStyle().copyWith(
        // Название приложения в информации о приложении
        fontSize: 36.0,
        fontWeight: FontWeight.bold,
        color: CustomColor.highlightDark),
    labelLarge: const TextStyle().copyWith(
        // Текст кнопки
        fontSize: 14.0,
        fontWeight: FontWeight.bold,
        color: CustomColor.buttonTextDark),
    labelMedium: const TextStyle().copyWith(
        // Lable
        fontSize: 12.0,
        fontWeight: FontWeight.bold,
        color: CustomColor.textDark),
    labelSmall: const TextStyle().copyWith(
        // SubLable
        fontSize: 11.0,
        fontWeight: FontWeight.bold,
        color: CustomColor.subTextDark),
    headlineLarge: const TextStyle().copyWith(
        fontSize: 32.0,
        fontWeight: FontWeight.bold,
        color: CustomColor.highlightDark),
    headlineMedium: const TextStyle().copyWith(
        fontSize: 28.0,
        fontWeight: FontWeight.bold,
        color: CustomColor.highlightDark),
    headlineSmall: const TextStyle().copyWith(
        fontSize: 24.0,
        fontWeight: FontWeight.bold,
        color: CustomColor.highlightDark),
    bodyLarge: const TextStyle().copyWith(
        fontSize: 16.0,
        fontWeight: FontWeight.bold,
        color: CustomColor.textDark),
    bodyMedium: const TextStyle().copyWith(
        fontSize: 14.0,
        fontWeight: FontWeight.bold,
        color: CustomColor.textDark),
    bodySmall: const TextStyle().copyWith(
        fontSize: 12.0,
        fontWeight: FontWeight.bold,
        color: CustomColor.textDark),
  );
}
