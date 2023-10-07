import 'package:flutter/material.dart';

class AppTheme {
  final bool darkMode;

  AppTheme({this.darkMode = true});

  ThemeData getTheme() => ThemeData(
        useMaterial3: true,
        brightness: darkMode ? Brightness.dark : Brightness.light,
      );
}
