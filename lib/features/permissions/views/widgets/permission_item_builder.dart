import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:pos/core/cache/cache_data.dart';
import 'package:pos/core/cache/cache_keys.dart';
import 'package:pos/core/helper/my_navigator.dart';
import 'package:pos/core/translation/translation_keys.dart';
import 'package:pos/core/utils/app_colors.dart';
import 'package:pos/core/widgets/show_delete_confirm_dialog.dart';
import 'package:pos/features/permissions/cubit/delete_permission/delete_permission_cubit.dart';
import 'package:pos/features/permissions/cubit/delete_permission/delete_permission_state.dart';
import 'package:pos/features/permissions/data/models/permission_model.dart';

class PermissionItemBuilder extends StatelessWidget {
  const PermissionItemBuilder({super.key, required this.permission});

  final PermissionModel permission;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()
      {
        MyNavigator.goTo( destinationBuilder: () => Scaffold());
      },
      child: Dismissible(
        onDismissed: (direction)
        {
          print("object");
        },
        confirmDismiss: (direction) async {
          return await showDeleteConfirmationDialog(
              context: context,
              title: TranslationsKeys.deleteCategory.tr,
              content: CacheData.lang == CacheKeys.keyEN ? permission.nameEn ?? '' : permission.nameAr ?? '',
              deleteButtonBuilder: (ctx, button, loading) =>  BlocProvider(
                create: (context) => DeletePermissionCubit(),
                child: BlocConsumer<DeletePermissionCubit, DeletePermissionState>(
                  listener: (context, state)
                  {
                    if (state is DeletePermissionSuccess)
                    {
                      deleteConfirmationDialogSuccess(ctx);
                    }
                    else if (state is DeletePermissionError)
                    {
                      deleteConfirmationDialogError(state.error);
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
          child: Text(
            CacheData.lang == CacheKeys.keyEN ?
            permission.nameEn ?? '' :
            permission.nameAr ?? '',
          ),
        ),
      ),
    );
  }
}
