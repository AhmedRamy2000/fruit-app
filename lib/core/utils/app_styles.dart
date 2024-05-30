import 'package:flutter/material.dart';
import 'package:fruitapp/core/utils/app_colors.dart';

abstract class AppStyles{
  static const header = TextStyle(
    fontFamily: 'cairo',
    fontSize: 23,
    fontWeight: FontWeight.w700,
    color: AppColors.textColor,
  );
  static const textStyleRegular = TextStyle(
    fontFamily: 'cairo',
    
    fontWeight: FontWeight.w400,
    color: AppColors.textColor,
  );
  // static const textStyle = TextStyle(
  //   fontFamily: 'cairo',
  //   fontSize: 23,
  //   fontWeight: FontWeight.w700,
  //   color: AppColors.textColor,
  // );
}