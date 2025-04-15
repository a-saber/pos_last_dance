import 'package:flutter/material.dart';

import 'app_borders.dart';
import 'app_colors.dart';
import 'app_text_styles.dart';

abstract class AppDecoration
{
  static InputDecoration inputDecoration({
    String? labelText,
    Widget? prefixIcon,
    Widget? suffixIcon
}) => InputDecoration(
    labelText: labelText,
    labelStyle: AppTextStyles.formText(color: AppColors.grey),
    prefixIcon: prefixIcon,
    suffixIcon: suffixIcon,
    border: OutlineInputBorder(
      borderRadius: AppBorders.form,
      borderSide: const BorderSide(color: AppColors.grey),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: AppBorders.form,
      borderSide: const BorderSide(color: AppColors.grey),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: AppBorders.form,
      borderSide: const BorderSide(color: AppColors.primary),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: AppBorders.form,
      borderSide: const BorderSide(color: AppColors.error),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: AppBorders.form,
      borderSide: const BorderSide(color: AppColors.primary),
    ),
    contentPadding: const EdgeInsetsDirectional.only(start: 16),
  );
}