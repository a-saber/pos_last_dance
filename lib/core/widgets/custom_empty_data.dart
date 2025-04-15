import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos/core/translation/translation_keys.dart';
import 'package:pos/core/widgets/custom_fields/custom_btn.dart';

class CustomEmptyData extends StatelessWidget {
  const CustomEmptyData({super.key, required this.onPressed});

  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(TranslationsKeys.youHaveNoData.tr),
            const SizedBox(
              height: 30,
            ),
            CustomFilledBtn(text: TranslationsKeys.refresh.tr, onPressed: onPressed)
          ],
        )
    );
  }
}
