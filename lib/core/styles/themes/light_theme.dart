import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../colors/app_colors.dart';

ThemeData lightMode = ThemeData(
  backgroundColor: AppColors.lightBackGroundColor,
  scaffoldBackgroundColor: AppColors.lightBackGroundColor,
  dialogTheme: const DialogTheme(
    backgroundColor: AppColors.lightBackGroundColor,
    elevation: 20.0,
  ),
  dividerColor: Colors.black26,
  primarySwatch: AppColors.primarySwatchColor,
  appBarTheme: const AppBarTheme(
    iconTheme: IconThemeData(
      color: Colors.grey,
    ),
    backgroundColor: AppColors.lightBackGroundColor,
    elevation: 0.0,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: AppColors.lightBackGroundColor,
      statusBarIconBrightness: Brightness.dark,
    ),
  ),
  iconTheme: const IconThemeData(
    color: AppColors.primaryColor,
  ),
  fontFamily: "Cairo",
);
