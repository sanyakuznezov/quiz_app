

 import 'package:flutter/material.dart';
import 'package:quiz_app/resources/app_colors.dart';


class AppTheme{

  static ThemeData get lightTheme{
    return ThemeData(
      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: color128,
        circularTrackColor: color128_40
      )
    );
  }



 }