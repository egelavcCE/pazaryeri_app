
import 'package:flutter/material.dart';

import '../color/project_color.dart';

class ProjectTheme{
  late ThemeData theme;

  ProjectTheme(BuildContext context){
    final mediaQuery = MediaQuery.of(context);
    theme = ThemeData(
      textTheme: TextTheme(
        displayLarge: TextStyle(
          fontSize: mediaQuery.size.width * 0.11,
        ),
        displayMedium: TextStyle( //+
          fontSize: mediaQuery.size.width * 0.1,
          color: ProjectColor.apricot.getColor(),
        ),
        displaySmall: TextStyle(
          fontSize: mediaQuery.size.width * 0.06,
        ),
        headlineLarge: TextStyle(
          fontSize: mediaQuery.size.width * 0.08,
        ),
        headlineMedium: TextStyle(
          fontSize: mediaQuery.size.width * 0.06,
        ),
        headlineSmall: TextStyle(
          fontSize: mediaQuery.size.width * 0.04,
        ),
        titleLarge: TextStyle(
          fontSize: mediaQuery.size.width * 0.05,
        ),
        titleMedium: TextStyle( //+
          fontSize: mediaQuery.size.width * 0.045,
        ),
        titleSmall: TextStyle( //+
          fontSize: mediaQuery.size.width * 0.035,
        ),
        bodyLarge: TextStyle(
          fontSize: mediaQuery.size.width * 0.04,
        ),
        bodyMedium: TextStyle(
          fontSize: mediaQuery.size.width * 0.032,
        ),
        bodySmall: TextStyle( //+
          fontSize: mediaQuery.size.width * 0.025,
        ),
        labelLarge: TextStyle(
          fontSize: mediaQuery.size.width * 0.03,
        ),
        labelMedium: TextStyle(
          fontSize: mediaQuery.size.width * 0.02,
        ),
        labelSmall: TextStyle(
          fontSize: mediaQuery.size.width * 0.01,
        ),
      )
    );
  }
}