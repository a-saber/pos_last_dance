import 'package:flutter/material.dart';
import 'package:pos/core/helper/my_navigator.dart';
import 'package:pos/core/utils/app_colors.dart';
import 'package:pos/core/utils/app_text_styles.dart';
import 'package:pos/features/permissions/data/models/permission_model.dart';
import 'package:pos/features/permissions/views/edit_permission_view.dart';

import 'delete_permission_confirm_dialog.dart';

class PermissionItemBuilder extends StatelessWidget {
  const PermissionItemBuilder({super.key, required this.permission});

  final PermissionModel permission;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()
      {
        MyNavigator.goTo(destinationBuilder: ()=>EditPermissionView(permission: PermissionModel.from(permission)));
      },
      child: Dismissible(
        onDismissed: (direction)
        {
          print("object");
        },
        confirmDismiss: (direction) async {
          return await showDeletePermissionConfirmDialog(
              context: context,
              permission: permission
          );
          },
        key: UniqueKey(),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.all(5),
          decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: AppColors.primary.withAlpha(25),
                  blurRadius: 7,
                  blurStyle: BlurStyle.outer,
                ),
              ]
          ),
          child: Text( permission.name ?? '',
            style: AppTextStyles.itemsTitle(),
          ),
        ),
      ),
    );
  }
}
