import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:pos/core/cache/cache_data.dart';
import 'package:pos/core/cache/cache_keys.dart';
import 'package:pos/core/helper/custom_validator.dart';
import 'package:pos/core/helper/my_navigator.dart';
import 'package:pos/core/helper/my_service_locator.dart';
import 'package:pos/core/translation/translation_keys.dart';
import 'package:pos/core/utils/app_paddings.dart';
import 'package:pos/core/widgets/custom_app_bar.dart';
import 'package:pos/core/widgets/custom_fields/custom_btn.dart';
import 'package:pos/core/widgets/custom_fields/custom_check_box.dart';
import 'package:pos/core/widgets/custom_fields/custom_form_field.dart';
import 'package:pos/core/widgets/custom_loading.dart';
import 'package:pos/core/widgets/custom_pop_up.dart';
import 'package:pos/core/widgets/my_custom_scroll_view.dart';
import 'package:pos/features/permissions/cubit/add_permission/add_permission_cubit.dart';
import 'package:pos/features/permissions/cubit/add_permission/add_permission_state.dart';
import 'package:pos/features/permissions/cubit/get_permissions/get_permissions_cubit.dart';
import 'package:pos/features/permissions/data/repo/permissions_repo.dart';
import 'package:pos/features/permissions/views/widgets/permission_data_builder.dart';

import 'widgets/permissions_cubit_builder.dart';

class AddPermissionView extends StatelessWidget {
  const AddPermissionView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddPermissionCubit(MyServiceLocator.getSingleton<PermissionsRepo>()),
      child: Scaffold(
        appBar: CustomAppBar(title: TranslationsKeys.addPermission.tr),
        body: BlocConsumer<AddPermissionCubit, AddPermissionState>(
          listener: (context, state)
          {
            if(state is AddPermissionSuccess)
            {
              GetPermissionsCubit.get(context).getPermissions();
              CustomPopUp.callMyToast(context: context, massage: TranslationsKeys.addedSuccess.tr, state: PopUpState.SUCCESS);
              MyNavigator.goBack();
            }
            else if(state is AddPermissionError)
            {
              CustomPopUp.callMyToast(context: context, massage: state.error, state: PopUpState.ERROR);
            }
          },
          builder: (context, state)
          {
            return PermissionDataBuilder(
              formKey: AddPermissionCubit.get(context).formKey,
              nameController: AddPermissionCubit.get(context).nameController,
              descriptionController: AddPermissionCubit.get(context).descriptionController,
              isLoading: state is AddPermissionLoading,
              onPressed: AddPermissionCubit.get(context).addPermission,
              permission: AddPermissionCubit.get(context).permission,
              onChanged:  (bool value, int index)
              {
                AddPermissionCubit.get(context).changePermissionStatus(index: index, status: value);
              },
              isEdit: false
            );
          },
        ),
      ),
    );
  }
}
