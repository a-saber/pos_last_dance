import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:pos/core/helper/my_navigator.dart';
import 'package:pos/core/translation/translation_keys.dart';
import 'package:pos/core/widgets/custom_app_bar.dart';
import 'package:pos/core/widgets/custom_fields/custom_btn.dart';
import 'package:pos/core/widgets/custom_pop_up.dart';
import 'package:pos/features/permissions/cubit/edit_permission/edit_permission_cubit.dart';
import 'package:pos/features/permissions/cubit/edit_permission/edit_permission_state.dart';
import 'package:pos/features/permissions/cubit/get_permissions/get_permissions_cubit.dart';
import 'package:pos/features/permissions/data/models/permission_model.dart';
import 'package:pos/features/permissions/data/repo/permissions_repo.dart';

import '../../../core/helper/my_service_locator.dart';
import 'widgets/delete_permission_confirm_dialog.dart';
import 'widgets/permission_data_builder.dart';

class EditPermissionView extends StatelessWidget {
  const EditPermissionView({super.key, required this.permission});

  final PermissionModel permission ;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EditPermissionCubit(MyServiceLocator.getSingleton<PermissionsRepo>(), permission),
      child: Scaffold(
        appBar: CustomAppBar(
          title: TranslationsKeys.editPermission.tr,
          actions:
          [
            CustomTextBtn(
              text: TranslationsKeys.delete.tr,
              onPressed: ()async
              {
                await showDeletePermissionConfirmDialog(
                  context: context,
                  permission: permission,
                  goBack: true
                );
              }
            ),
          ],
        ),
        body: BlocConsumer<EditPermissionCubit, EditPermissionState>(
          listener: (context, state)
          {
            if(state is EditPermissionSuccess)
            {
              GetPermissionsCubit.get(context).getPermissions();
              CustomPopUp.callMyToast(context: context, massage: TranslationsKeys.updatedSuccess.tr, state: PopUpState.SUCCESS);
              MyNavigator.goBack();
            }
            else if(state is EditPermissionError)
            {
              CustomPopUp.callMyToast(context: context, massage: state.error, state: PopUpState.ERROR);
            }
          },
          builder: (context, state)
          {
            return PermissionDataBuilder(
                formKey: EditPermissionCubit.get(context).formKey,
                nameController: EditPermissionCubit.get(context).nameController,
                descriptionController: EditPermissionCubit.get(context).descriptionController,
                isLoading: state is EditPermissionLoading,
                onPressed: EditPermissionCubit.get(context).editPermission,
                permission: EditPermissionCubit.get(context).permission,
                onChanged:  (bool value, int index)
                {
                  EditPermissionCubit.get(context).changePermissionStatus(index: index, status: value);
                },
                isEdit: true
            );
          },
        ),
      ),
    );
  }
}
