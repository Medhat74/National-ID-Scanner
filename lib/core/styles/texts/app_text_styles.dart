import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import '../colors/app_colors.dart';

class AppTextStyle {
  static TextStyle headLine() => TextStyle(
        fontSize: 23.0.sp,
        fontWeight: FontWeight.w800,
        fontFamily: "Cairo",
      );

  static TextStyle appBarText() => TextStyle(
      fontSize: 20.0.sp,
      fontWeight: FontWeight.bold,
      fontFamily: "Cairo",
      color: AppColors.primaryColor);
  static TextStyle title() => TextStyle(
        fontSize: 18.0.sp,
        fontWeight: FontWeight.w600,
        fontFamily: "Cairo",
      );
  static TextStyle bodyText() => TextStyle(
        fontSize: 15.0.sp,
        fontWeight: FontWeight.normal,
        height: 1.2.h,
        fontFamily: "Cairo",
      );
  static TextStyle subTitle() => TextStyle(
        fontSize: 13.0.sp,
        fontWeight: FontWeight.bold,
        //color: Colors.grey,
        height: 1.2.h,
        fontFamily: "Cairo",
      );
}
