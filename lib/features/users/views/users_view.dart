import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos/core/helper/my_navigator.dart';
import 'package:pos/core/translation/translation_keys.dart';
import 'package:pos/core/utils/app_colors.dart';
import 'package:pos/core/utils/app_paddings.dart';
import 'package:pos/core/widgets/custom_app_bar.dart';
import 'package:pos/core/widgets/custom_floating_action_btn.dart';
import 'package:pos/core/widgets/custom_refresh_indicator.dart';
import 'package:pos/features/users/cubit/get_users/get_users_cubit.dart';
import 'package:pos/features/users/views/add_user_view.dart';
import 'package:pos/features/users/views/widgets/user_item_builder.dart';
import 'package:pos/features/users/views/widgets/users_cubit_builder.dart';

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
      body: CustomRefreshIndicator(
        onRefresh: GetUsersCubit.get(context).getUsers,
        child: Padding(
          padding: AppPaddings.defaultView,
          child: UsersCubitBuilder(
            usersBuilder: (context, users)
            {
              return ListView.builder(
                itemCount: users.length,
                itemBuilder: (context, index) {
                  return UserItemBuilder(user: users[index]);
                },
              );
          }),
        ),
      ),
    );
  }
}
