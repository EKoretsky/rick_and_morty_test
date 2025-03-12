import 'package:flutter/material.dart';

// part './light_text_theme.dart';
//
// part './dark_text_theme.dart';

class AppTheme {
  ThemeData get light {
    return ThemeData(
      iconButtonTheme: IconButtonThemeData(
        style: ButtonStyle(
          padding: WidgetStatePropertyAll(EdgeInsets.zero),
          visualDensity: VisualDensity(
            vertical: VisualDensity.minimumDensity,
            horizontal: VisualDensity.minimumDensity,
          ),
        ),
      ),
    );
  }

  // Dark theme
  ThemeData get dark {
    return ThemeData();
  }
}
