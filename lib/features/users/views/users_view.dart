import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos/core/helper/my_navigator.dart';
import 'package:pos/core/translation/translation_keys.dart';
import 'package:pos/core/widgets/custom_app_bar.dart';
import 'package:pos/core/widgets/custom_floating_action_btn.dart';
import 'package:pos/features/users/views/add_user_view.dart';

class UsersView extends StatelessWidget {
  const UsersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: CustomFloatingActionBtn(
          onPressed: ()
          {
            MyNavigator.goTo(destinationBuilder: () => AddUserView());
          }
      ),
      appBar: CustomAppBar(title: TranslationsKeys.users.tr),
    );
  }
}
