import 'package:flutter/material.dart';

/// Text Styles to be used within the App
class AppTextStyle {
  static TextStyle get headerOne => const TextStyle(
      fontWeight: FontWeight.w700, fontSize: 42, height: 71 / 42);

  static TextStyle get headerTwo => const TextStyle(
      fontWeight: FontWeight.w800, fontSize: 28, height: 42 / 28);

  static TextStyle get headerThree => const TextStyle(
      fontWeight: FontWeight.w800, fontSize: 24, height: 40.8 / 24);

  static TextStyle get headerFour => const TextStyle(
      fontWeight: FontWeight.w800, fontSize: 20, height: 24 / 20);

  static TextStyle get headerFive => const TextStyle(
      fontWeight: FontWeight.w500, fontSize: 16, height: 24 / 16);

  static TextStyle get bodyOne => const TextStyle(
      fontWeight: FontWeight.w400, fontSize: 16, height: 24 / 16);

  static TextStyle get bodyTwo => const TextStyle(
      fontWeight: FontWeight.w700, fontSize: 14, height: 14 / 14);

  static TextStyle get bodyThree => const TextStyle(
      fontWeight: FontWeight.w400, fontSize: 14, height: 21 / 14);

  static TextStyle get bodyFour => const TextStyle(
      fontWeight: FontWeight.w600, fontSize: 12, height: 13 / 12);

  static TextStyle get bodyFive => const TextStyle(
      fontWeight: FontWeight.w700, fontSize: 12, height: 16 / 12);
}
