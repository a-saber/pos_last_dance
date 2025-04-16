import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos/core/helper/my_navigator.dart';
import 'package:pos/core/translation/translation_keys.dart';
import 'package:pos/core/utils/app_paddings.dart';
import 'package:pos/core/widgets/custom_app_bar.dart';
import 'package:pos/core/widgets/custom_floating_action_btn.dart';
import 'package:pos/core/widgets/custom_refresh_indicator.dart';
import 'package:pos/features/permissions/cubit/get_permissions/get_permissions_cubit.dart';
import 'package:pos/features/permissions/views/add_permission_view.dart';
import 'package:pos/features/permissions/views/widgets/permission_item_builder.dart';
import 'package:pos/features/permissions/views/widgets/permissions_cubit_builder.dart';

class PermissionsView extends StatelessWidget {
  const PermissionsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: CustomFloatingActionBtn(
          onPressed: () {
            MyNavigator.goTo(destinationBuilder: () => AddPermissionView());
          }
      ),
      appBar: CustomAppBar(title: TranslationsKeys.permissions.tr),
      body: CustomRefreshIndicator(
        onRefresh: GetPermissionsCubit.get(context).getPermissions,
        child: Padding(
          padding: AppPaddings.defaultView,
          child: PermissionsCubitBuilder(permissionsBuilder: (context, permissions) {
            return ListView.builder(
              itemCount: permissions.length,
              itemBuilder: (context, index) {
                return PermissionItemBuilder(permission: permissions[index]);
              },
            );

          }),
        ),
      ),
    );
  }
}
