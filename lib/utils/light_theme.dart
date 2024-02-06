import 'package:flutter/material.dart';
import 'package:gmail_settimgs_page_ui/utils/colors.dart';

ThemeData lightTheme = ThemeData(
  fontFamily: 'Poppins',
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.white,
    centerTitle: true,
    elevation: 0,
    titleTextStyle: TextStyle(
      fontSize: 18,
      color: AppColor.secondaryColor,
      fontWeight: FontWeight.w600,
      fontFamily: 'Poppins',
    ),
  ),
);
