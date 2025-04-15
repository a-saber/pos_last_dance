import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos/core/translation/translation_keys.dart';
import 'package:pos/core/utils/app_text_styles.dart';

import 'custom_fields/custom_btn.dart';

class CustomError extends StatelessWidget {
  const CustomError({super.key, required this.error, required this.onPressed});

  final void Function() onPressed;
  final String error;
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              error,
              textAlign: TextAlign.center,
              style: AppTextStyles.errorText,
            ),
            const SizedBox(
              height: 10,
            ),
            CustomFilledBtn(text: TranslationsKeys.refresh.tr, onPressed: onPressed)
          ],
        )
    );
  }
}
