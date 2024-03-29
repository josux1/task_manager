import 'package:flutter/material.dart';
import 'package:tsk_mg/ui/utils/colors.dart';

class AppTheme {
  static ThemeData dark() {
    return ThemeData(
        colorSchemeSeed: c.primary,
        fontFamily: 'Poppins',
        useMaterial3: true,
        brightness: Brightness.dark);
  }

  static ThemeData light() {
    return ThemeData(
        scaffoldBackgroundColor: const Color(0xfff2f2f2),
        colorSchemeSeed: c.primary,
        fontFamily: 'Poppins',
        useMaterial3: true,
        brightness: Brightness.light);
  }
}
