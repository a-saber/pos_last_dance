import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos/core/translation/translation_keys.dart';
import 'package:pos/core/widgets/custom_app_bar.dart';

class EditUserView extends StatelessWidget {
  const EditUserView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: TranslationsKeys.editUser.tr),
    );
  }
}
