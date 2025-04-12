import 'package:flutter/material.dart';
import 'package:pos/core/utils/app_colors.dart';
import 'package:pos/core/utils/app_text_styles.dart';

class CustomCheckbox extends StatelessWidget {
  final String title;
  final bool value;
  final ValueChanged<bool?> onChanged;

  const CustomCheckbox({
    super.key,
    required this.title,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      checkColor:   AppColors.black,

      contentPadding: EdgeInsets.zero,
      title:  Text(
      title,
      style: AppTextStyles.formText(color: AppColors.black),
    ),
      value: value,
      onChanged: onChanged,
      activeColor: AppColors.yellow,
    );
  }
}
