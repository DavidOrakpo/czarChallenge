import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final themeProvider = ChangeNotifierProvider((ref) {
  return DarkThemeProvider();
});

class DarkThemePreference {
  // ignore: constant_identifier_names
  static const THEME_STATUS = "THEMESTATUS";

  setDarkTheme(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(THEME_STATUS, value);
  }

  Future<bool> getTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(THEME_STATUS) ?? false;
  }
}

class DarkThemeProvider with ChangeNotifier {
  DarkThemePreference darkThemePreference = DarkThemePreference();
  bool _darkTheme = false;

  bool get darkTheme => _darkTheme;

  SystemUiOverlayStyle dynamicStatusBarOverlay({
    Color? statusBarColor,
    Brightness? statusBarIconBrightness,
    Color? systemNavigationBarColor,
    Brightness? systemNavigationBarIconBrightnes,
  }) {
    return darkTheme
        ? SystemUiOverlayStyle(
            statusBarColor: statusBarColor ?? Colors.transparent,
            statusBarIconBrightness:
                statusBarIconBrightness ?? Brightness.light,
            systemNavigationBarColor: systemNavigationBarColor ?? Colors.black,
            systemNavigationBarIconBrightness:
                systemNavigationBarIconBrightnes ?? Brightness.light,
          )
        : SystemUiOverlayStyle(
            statusBarColor: statusBarColor ?? Colors.transparent,
            statusBarIconBrightness:
                statusBarIconBrightness ?? Brightness.light,
            systemNavigationBarColor: systemNavigationBarColor ?? Colors.white,
            systemNavigationBarIconBrightness:
                systemNavigationBarIconBrightnes ?? Brightness.dark,
          );
  }

  set darkTheme(bool value) {
    _darkTheme = value;
    darkThemePreference.setDarkTheme(value);
    dynamicStatusBarOverlay();
    notifyListeners();
  }
}
