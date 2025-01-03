import 'package:flutter/material.dart';

/// all custom application theme
class AppTheme {
  /// default application theme
  static ThemeData get basic => ThemeData(
        canvasColor: Colors.white,
        primarySwatch: Colors.blue,
      );

  // you can add other custom theme in this class like  light theme, dark theme ,etc.

  // example :
  // static ThemeData get light => ThemeData();
  // static ThemeData get dark => ThemeData();

  // Suggestion: to make managing themes easier, create a separate class for each theme.
}
