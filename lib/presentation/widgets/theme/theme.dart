import 'package:flutter/material.dart';

enum AppTheme { lightTheme, darkTheme }

final appThemeData = {
  AppTheme.lightTheme: ThemeData(
      brightness: Brightness.light,
      primaryColor: Colors.black87,
      backgroundColor: Colors.white),
  AppTheme.darkTheme: ThemeData(
      brightness: Brightness.dark,
      primaryColor: Colors.white,
      backgroundColor: Colors.black87),
};
