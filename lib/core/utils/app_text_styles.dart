import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_constants.dart';

class FontWeights
{
  static const FontWeight extraLight = FontWeight.w200;
  static const FontWeight light = FontWeight.w300;
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight semiBold = FontWeight.w600;
  static const FontWeight bold = FontWeight.w700;
  static const FontWeight extraBold = FontWeight.w800;
  static const FontWeight black = FontWeight.w900;
}

class AppTextStyles
{
  static const TextStyle appBarTitle = TextStyle(
    fontWeight: FontWeights.semiBold,
    fontSize: 25,
    color: AppColors.black,
    fontFamily: AppConstants.fontFamily,
  );
  static TextStyle btnText({Color color= AppColors.white}) => TextStyle(
    fontWeight: FontWeights.medium,
    fontSize: 20,
    color: color,
  );
  static TextStyle formText({Color color= AppColors.primary}) => TextStyle(
    fontWeight: FontWeights.medium,
    fontSize: 18,
    color: color,
  );
  static TextStyle errorText= TextStyle(
    fontWeight: FontWeights.medium,
    fontSize: 16,
    color: AppColors.error,
  );

  static TextStyle homeSubTitle = TextStyle(
    fontWeight: FontWeights.semiBold,
    fontSize: 20,
    color: AppColors.black,
  );
}