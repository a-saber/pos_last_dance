import 'package:flutter/material.dart';
import 'package:pos/core/utils/app_borders.dart';
import 'package:pos/core/utils/app_colors.dart';
import 'package:pos/core/utils/app_decoration.dart';
import 'package:pos/core/utils/app_text_styles.dart';

class CustomFormField extends StatelessWidget {
  final TextEditingController controller;
  final String? labelText;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool obscureText;

  const CustomFormField({
    super.key,
    required this.controller,
    this.labelText,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      obscuringCharacter: '●',
      validator: validator,
      style: AppTextStyles.formText(),
      decoration: AppDecoration.inputDecoration(
        labelText: labelText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
      ),
    );
  }
}
