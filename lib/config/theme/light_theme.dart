import 'package:flutter/material.dart';
import 'package:flutter_news_app/core/constant/app_sizes.dart';
import 'package:flutter_news_app/core/constant/app_text_style.dart';

ThemeData lightTheme() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: appBarTheme(),
    fontFamily: "Roboto",
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: AppTextStyle.elevatedTextStyle,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSizes.double15),
        ),
        backgroundColor: Colors.white,
        elevation: AppSizes.elevation,
        minimumSize: const Size(double.infinity, 0),
      ),
    ),
  );
}

AppBarTheme appBarTheme() {
  return const AppBarTheme(
    surfaceTintColor: Colors.white,
    color: Colors.white,
    elevation: 0,
    centerTitle: true,
    iconTheme: IconThemeData(color: Colors.grey),
    titleTextStyle: AppTextStyle.appBarTextStyle,
  );
}
