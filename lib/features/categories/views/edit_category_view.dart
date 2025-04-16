import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:pos/core/helper/my_navigator.dart';
import 'package:pos/core/helper/my_service_locator.dart';
import 'package:pos/core/translation/translation_keys.dart';
import 'package:pos/core/widgets/custom_app_bar.dart';
import 'package:pos/core/widgets/custom_fields/custom_btn.dart';
import 'package:pos/core/widgets/custom_pop_up.dart';
import 'package:pos/features/categories/data/models/category_model.dart';
import 'package:pos/features/categories/data/repo/category_repo.dart';
import 'package:pos/features/categories/manager/get_categories/get_categories_cubit.dart';
import 'package:pos/features/categories/manager/edit_category/edit_category_cubit.dart';
import 'package:pos/features/categories/views/widgets/category_data_builder.dart';

import '../manager/edit_category/edit_category_state.dart';
import 'widgets/delete_category_confirm_dialog.dart';

class EditCategoryView extends StatelessWidget {
  const EditCategoryView({super.key, required this.category});

  final CategoryModel category;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EditCategoryCubit(MyServiceLocator.getSingleton<CategoryRepo>(), category),
      child: Scaffold(
        appBar: CustomAppBar(title: TranslationsKeys.addCategory.tr,
        actions:
        [
          CustomTextBtn(
            text: TranslationsKeys.delete.tr,
            onPressed: ()async
            {
              await showDeleteCategoryConfirmDialog(context: context, category: category,goBack: true);
            }
          )
        ],),
        body: BlocConsumer<EditCategoryCubit, EditCategoryState>(
          listener: (context, state) {
            if(state is EditCategorySuccess)
            {
              GetCategoriesCubit.get(context).getCategories();
              CustomPopUp.callMyToast(context: context, massage: TranslationsKeys.addedSuccess.tr, state: PopUpState.SUCCESS);
              MyNavigator.goBack();
            }
            else if(state is EditCategoryError)
            {
              CustomPopUp.callMyPopUp(context: context, massage: state.error, state: PopUpState.ERROR);
            }
          },
          builder: (context, state) {
            return CategoryDataBuilder(
              formKey: EditCategoryCubit.get(context).formKey,
              nameController: EditCategoryCubit.get(context).nameController,
              descriptionController: EditCategoryCubit.get(context).descriptionController,
              onTap: EditCategoryCubit.get(context).editCategory,
              onSelected: (image)=>EditCategoryCubit.get(context).image = image,
              isLoading: state is EditCategoryLoading,
              isEdit: true
            );
          },
        ),
      ),
    );
  }
}
