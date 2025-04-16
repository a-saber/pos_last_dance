import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:pos/core/helper/my_navigator.dart';
import 'package:pos/core/helper/my_service_locator.dart';
import 'package:pos/core/translation/translation_keys.dart';
import 'package:pos/core/widgets/show_delete_confirm_dialog.dart';
import 'package:pos/features/categories/data/models/category_model.dart';
import 'package:pos/features/categories/data/repo/category_repo.dart';
import 'package:pos/features/categories/manager/delete_category/delete_category_cubit.dart';
import 'package:pos/features/categories/manager/delete_category/delete_category_state.dart';
import 'package:pos/features/categories/manager/get_categories/get_categories_cubit.dart';


Future<bool?> showDeleteCategoryConfirmDialog({required BuildContext context,
  required CategoryModel category,
  bool goBack = false}) async
{
  return await showDeleteConfirmationDialog(
      context: context,
      title: TranslationsKeys.deleteCategory.tr,
      content: category.name ?? '',
      deleteButtonBuilder: (ctx, button, loading) =>  BlocProvider(
        create: (context) => DeleteCategoryCubit(MyServiceLocator.getSingleton<CategoryRepo>()),
        child: BlocConsumer<DeleteCategoryCubit, DeleteCategoryState>(
          listener: (context, state)
          {
            if (state is DeleteCategorySuccess)
            {
              deleteConfirmationDialogSuccess(ctx);
              GetCategoriesCubit.get(context).getCategories();
              if(goBack)
              {
                MyNavigator.goBack();
              }
            }
            else if (state is DeleteCategoryError)
            {
              deleteConfirmationDialogError( ctx, state.error);
            }
          },
          builder: (context, state) {
            if (state is DeleteCategoryLoading)
            {
              return loading;
            }
            return button(onPressed: () => DeleteCategoryCubit.get(context).deleteCategory(category: category));
          },
        ),
      )
  );

}