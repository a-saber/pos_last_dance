import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:pos/core/helper/my_navigator.dart';
import 'package:pos/core/helper/service_loactor.dart';
import 'package:pos/core/translation/translation_keys.dart';
import 'package:pos/core/widgets/show_delete_confirm_dialog.dart';
import 'package:pos/features/permissions/cubit/delete_permission/delete_permission_cubit.dart';
import 'package:pos/features/permissions/cubit/delete_permission/delete_permission_state.dart';
import 'package:pos/features/permissions/cubit/get_permissions/get_permissions_cubit.dart';
import 'package:pos/features/permissions/data/models/permission_model.dart';
import 'package:pos/features/permissions/data/repo/permissions_repo.dart';

Future<bool?> showDeletePermissionConfirmDialog({required BuildContext context, required PermissionModel permission,
bool goBack = false}) async
{
  return await showDeleteConfirmationDialog(
      context: context,
      title: TranslationsKeys.deletePermission.tr,
      content: permission.name ?? '',
      deleteButtonBuilder: (ctx, button, loading) =>  BlocProvider(
        create: (context) => DeletePermissionCubit(MyServiceLocator.getSingleton<PermissionsRepo>()),
        child: BlocConsumer<DeletePermissionCubit, DeletePermissionState>(
          listener: (context, state)
          {
            if (state is DeletePermissionSuccess)
            {
              deleteConfirmationDialogSuccess(ctx);
              GetPermissionsCubit.get(context).getPermissions();
              if(goBack)
              {
                MyNavigator.goBack();
              }
            }
            else if (state is DeletePermissionError)
            {
              deleteConfirmationDialogError( ctx, state.error);
            }
          },
          builder: (context, state) {
            if (state is DeletePermissionLoading)
            {
              return loading;
            }
            return button(onPressed: () => DeletePermissionCubit.get(context).deletePermission(permission: permission));
          },
        ),
      )
  );

}