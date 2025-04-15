import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
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
import 'package:pos/core/widgets/image_manager/image_manager_view.dart';
import 'package:pos/core/widgets/my_custom_scroll_view.dart';
import 'package:pos/features/categories/manager/add_category/add_category_cubit.dart';
import 'package:pos/features/categories/manager/add_category/add_category_state.dart';
import 'package:pos/features/categories/manager/get_categories/get_categories_cubit.dart';

class AddCategoryView extends StatelessWidget {
  const AddCategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddCategoryCubit(),
      child: Scaffold(
        appBar: CustomAppBar(title: TranslationsKeys.addCategory.tr),
        body: Builder(builder: (context) {
          return Form(
            key: AddCategoryCubit.get(context).formKey,
            child: MyCustomScrollView(
              child: Padding(
                padding: AppPaddings.defaultView,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children:
                  [

                    ImageManagerView(onSelected: (image) {
                      AddCategoryCubit.get(context).image = image;
                    }),
                    SizedBox(
                      height: 20,
                    ),
                    CustomFormField(
                      controller: AddCategoryCubit.get(context).nameController,
                      labelText: TranslationsKeys.name.tr,
                      validator: MyFormValidators.validateRequired,
                      keyboardType: TextInputType.name,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CustomFormField(
                      controller: AddCategoryCubit.get(context).orderNumberController,
                      labelText: TranslationsKeys.orderNumber.tr,
                      validator: MyFormValidators.validateInteger,
                      keyboardType: TextInputType.number,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    BlocBuilder<AddCategoryCubit, AddCategoryState>(
                      builder: (context, state) {
                        return CustomCheckbox(
                          title: TranslationsKeys.showInSales.tr,
                          value: AddCategoryCubit.get(context).showInSales,
                          onChanged: (bool? value)
                          {
                            if(value != null) {
                              AddCategoryCubit.get(context).changeShowInSalesStatus(value: value);
                            }
                          }
                        );
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),

                    BlocConsumer<AddCategoryCubit, AddCategoryState>(
                      listener: (context, state) {
                        if(state is AddCategorySuccess)
                        {
                          GetCategoriesCubit.get(context).getCategories();
                          CustomPopUp.callMyToast(context: context, massage: TranslationsKeys.addedSuccess.tr, state: PopUpState.SUCCESS);
                          MyNavigator.goBack();
                        }
                        else if(state is AddCategoryError)
                        {
                          CustomPopUp.callMyPopUp(context: context, massage: state.error, state: PopUpState.ERROR);
                        }
                      },
                      builder: (context, state) {
                        if (state is AddCategoryLoading)
                        {
                          return const CustomLoading();
                        }
                        return CustomFilledBtn(
                          text: TranslationsKeys.addCategory.tr,
                          onPressed: AddCategoryCubit.get(context).addCategory
                        );
                      },
                    )
                  ],
                ),
              )
            ),
          );
        }),
      ),
    );
  }
}
