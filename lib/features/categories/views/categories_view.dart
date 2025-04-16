import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos/core/helper/my_navigator.dart';
import 'package:pos/core/translation/translation_keys.dart';
import 'package:pos/core/utils/app_paddings.dart';
import 'package:pos/core/widgets/custom_app_bar.dart';
import 'package:pos/core/widgets/custom_floating_action_btn.dart';
import 'package:pos/core/widgets/custom_refresh_indicator.dart';
import 'package:pos/features/categories/manager/get_categories/get_categories_cubit.dart';
import 'package:pos/features/categories/views/widgets/categories_cubit_builder.dart';
import 'package:pos/features/categories/views/widgets/category_item_builder.dart';

import 'add_category_view.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: CustomFloatingActionBtn(
        onPressed: () {
          MyNavigator.goTo(destinationBuilder:() => AddCategoryView()) ;
        },
      ),
      appBar: CustomAppBar(title: TranslationsKeys.categories.tr),
      body: Padding(
        padding: AppPaddings.defaultView,
        child: CustomRefreshIndicator(
          onRefresh: ()async
          {
            return await GetCategoriesCubit.get(context).getCategories();
          },
          child: CategoriesCubitBuilder(
            categoryItemBuilder: (context, categories) {
              return ListView.builder(
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return CategoryItemBuilder(
                    index: index,
                    category: categories[index]
                  );
                },
              );
            }
          ),
        ),
      ),
    );
  }
}
