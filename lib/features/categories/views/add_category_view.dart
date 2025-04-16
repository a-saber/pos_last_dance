import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:pos/core/helper/my_navigator.dart';
import 'package:pos/core/helper/my_service_locator.dart';
import 'package:pos/core/translation/translation_keys.dart';
import 'package:pos/core/widgets/custom_app_bar.dart';
import 'package:pos/core/widgets/custom_pop_up.dart';
import 'package:pos/features/categories/data/repo/category_repo.dart';
import 'package:pos/features/categories/manager/add_category/add_category_cubit.dart';
import 'package:pos/features/categories/manager/add_category/add_category_state.dart';
import 'package:pos/features/categories/manager/get_categories/get_categories_cubit.dart';

import 'widgets/category_data_builder.dart';

class AddCategoryView extends StatelessWidget {
  const AddCategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddCategoryCubit(MyServiceLocator.getSingleton<CategoryRepo>()),
      child: Scaffold(
        appBar: CustomAppBar(title: TranslationsKeys.addCategory.tr),
        body: BlocConsumer<AddCategoryCubit, AddCategoryState>(
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
            return CategoryDataBuilder(
                formKey: AddCategoryCubit.get(context).formKey,
                nameController: AddCategoryCubit.get(context).nameController,
                descriptionController: AddCategoryCubit.get(context).descriptionController,
                onTap: AddCategoryCubit.get(context).addCategory,
                onSelected: (image)=>AddCategoryCubit.get(context).image = image,
                isLoading: state is AddCategoryLoading,
                isEdit: false
            );
          },
        ),
      ),
    );
  }
}
