import 'package:flutter/material.dart';
import 'package:pos/core/utils/app_text_styles.dart';

class CustomError extends StatelessWidget {
  const CustomError({super.key, required this.error});

  final String error;
  @override
  Widget build(BuildContext context) {
    return  Text(error,
      textAlign: TextAlign.center,
      style: AppTextStyles.errorText,);
  }
}
