import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos/core/translation/translation_keys.dart';

class CustomEmptyData extends StatelessWidget {
  const CustomEmptyData({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(TranslationsKeys.youHaveNoData.tr)
    );
  }
}
