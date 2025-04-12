import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos/core/translation/translation_keys.dart';
import 'package:pos/core/widgets/custom_app_bar.dart';

class EditPermissionView extends StatelessWidget {
  const EditPermissionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: TranslationsKeys.editPermission.tr),
    );
  }
}
