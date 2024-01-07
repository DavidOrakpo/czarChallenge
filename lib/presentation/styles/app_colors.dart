import 'package:flutter/material.dart';

class AppColors {
  // static const Color darkShade = Color(0xFFF5F5F5);
  static const Color white = Color(0xFFFFFFFF);
  static const Color primary = Color(0xFF6956E5);
  static const Color textGray = Color(0xFF979797);
  static const Color progressIndicatorBackgroundDark = Color(0xFF333333);
  static const Color black = Color(0xFF000000);
  static const Color black2 = Color(0xFF1D1D1D);
  static const Color black3 = Color(0xFF222222);
  static const Color info = Color(0xFF2F80ED);
  static const defaultContainerColor = Color(0xFFF6F6F6);
  static const Color warning = Color(0xFFE2B93B);

  static const purple = MaterialColor(
    0xFF6956E5,
    {
      100: Color(0xFFFFFFFF),
      200: Color(0xFFF0EEFC),
      300: Color(0xFFE1DDFA),
      400: Color(0xFFD2CCF7),
      500: Color(0xFFC3BBF5),
      600: Color(0xFFA59AEF),
      700: Color(0xFF8778EA),
      800: primary,
    },
  );

  static const accent = MaterialColor(
    0xFF040311,
    {
      100: Color(0xFF5545BB),
      200: Color(0xFF413590),
      400: Color(0xFF2C2466),
      500: Color(0xFF221C51),
      600: Color(0xFF18143B),
      800: Color(0xFF0E0B26),
      900: Color(0xFF040311),
    },
  );

  static const gray = MaterialColor(0xFF333333, {
    500: Color(0xFFE0E0E0),
    400: Color(0xFFBDBDBD),
    300: Color(0xFF828282),
    200: Color(0xFF4F4F4F),
    100: Color(0xFF333333),
  });

  static const errorColor = MaterialColor(0xFFe25c5c, {
    100: Color(0xFFfcefef),
    200: Color(0xFFF6CECE),
    300: Color(0xFFEE9D9D),
    400: Color(0xFFE87D7D),
    500: Color(0xFFE25C5C),
    600: Color(0xFFE84E4E),
  });

  static const successColor = MaterialColor(0xFF2D955D, {
    100: Color(0xFFEFFAF4),
    200: Color(0xFFDCF0E5),
    300: Color(0xFFB5DCC7),
    400: Color(0xFF7BBD99),
    500: Color(0xFF2D955D),
    600: Color(0xFF1BD47B)
  });
}
