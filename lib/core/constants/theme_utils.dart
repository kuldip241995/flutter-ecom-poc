import 'package:flutter/material.dart';
import 'package:flutter_poc/core/constants/color.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    primaryColor: AppColors.primaryColor,
    scaffoldBackgroundColor: AppColors.white,
    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary: AppColors.accentColor,
    ),
    fontFamily: "Poppins",
    appBarTheme: AppBarTheme(
      color: Colors.blue[100],
    ),
    textTheme: TextTheme(
      headline6: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w700),
      bodyText2: TextStyle(fontSize: 16.0),
    ),
    // buttonTheme: ButtonThemeData(
    //   buttonColor: Colors.white,
    //   textTheme: ButtonTextTheme.primary,
    // ),
    // inputDecorationTheme: InputDecorationTheme(
    //   border: OutlineInputBorder(),
    //   focusedBorder: OutlineInputBorder(
    //     borderSide: BorderSide(color: Colors.blue),
    //   ),
    // ),
  );
}
