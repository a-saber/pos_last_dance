import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:pos/core/cache/cache_data.dart';
import 'package:pos/core/cache/cache_keys.dart';
import 'package:pos/core/helper/custom_validator.dart';
import 'package:pos/core/helper/my_navigator.dart';
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

import 'widgets/permissions_cubit_builder.dart';

class AddPermissionView extends StatelessWidget {
  const AddPermissionView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) => AddPermissionCubit(),
  child: Scaffold(
      appBar: CustomAppBar(title: TranslationsKeys.addPermission.tr),
      body: BlocConsumer<AddPermissionCubit, AddPermissionState>(
        listener: (context, state)
        {
          if(state is AddPermissionSuccess)
          {
            GetPermissionsCubit.get(context).getPermissions();
            CustomPopUp.callMyToast(massage: TranslationsKeys.addedSuccess.tr, state: PopUpState.SUCCESS);
            MyNavigator.goBack();
          }
          else if(state is AddPermissionError)
          {
            CustomPopUp.callMyToast(massage: state.error, state: PopUpState.ERROR);
          }
        },
        builder: (context, state) {
          return Form(
            key: AddPermissionCubit.get(context).formKey,
            child: Padding(
              padding: AppPaddings.defaultView,
              child: Column(
                children: [
                  Expanded(
                    child: MyCustomScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children:
                        [
                          SizedBox(
                            height: 10,
                          ),
                          CustomFormField(
                            controller: AddPermissionCubit.get(context).nameArController,
                            labelText: TranslationsKeys.nameAr.tr,
                            validator: MyFormValidators.validateRequired,
                            keyboardType: TextInputType.name,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          CustomFormField(
                            controller: AddPermissionCubit.get(context).nameEnController,
                            labelText: TranslationsKeys.nameEn.tr,
                            validator: MyFormValidators.validateRequired,
                            keyboardType: TextInputType.name,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          CustomFormField(
                            controller: AddPermissionCubit.get(context).descriptionController,
                            labelText: TranslationsKeys.description.tr,
                            validator: MyFormValidators.validateRequired,
                            keyboardType: TextInputType.text,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                         ListView.separated(
                          separatorBuilder: (context, index) => const SizedBox(
                            height: 20,
                          ),
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: AddPermissionCubit.get(context).permission.items.length,
                          itemBuilder: (context, index) {
                            return CustomCheckbox(
                              title: CacheData.lang == CacheKeys.keyEN ?
                              AddPermissionCubit.get(context).permission.items[index].nameEn??'' :
                              AddPermissionCubit.get(context).permission.items[index].nameAr??'',
                              value: AddPermissionCubit.get(context).permission.items[index].isSelected,
                              onChanged: (bool? value)
                              {
                                if(value != null)
                                {
                                  AddPermissionCubit.get(context).changePermissionStatus(index: index, status: value);
                                }
                              }
                            );
                          },
                         ),
                                    
                        ],
                      ),
                    ),
                  ),
                  Builder(builder: (context)
                  {
                    if (state is AddPermissionLoading) {
                      return const CustomLoading();
                    }
                    return CustomFilledBtn(
                        text: TranslationsKeys.addPermission.tr,
                        onPressed: AddPermissionCubit.get(context).addPermission
                    );
                  }),
                ],
              ),
            ),
          );

        },
      ),
    ),
);
  }
}
