import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:pos/core/helper/my_navigator.dart';
import 'package:pos/core/translation/translation_keys.dart';
import 'package:pos/core/utils/app_paddings.dart';
import 'package:pos/core/utils/app_transition.dart';
import 'package:pos/core/widgets/custom_app_bar.dart';
import 'package:pos/core/widgets/custom_empty_data.dart';
import 'package:pos/core/widgets/custom_error.dart';
import 'package:pos/core/widgets/custom_floating_action_btn.dart';
import 'package:pos/core/widgets/custom_loading.dart';
import 'package:pos/features/categories/manager/get_categories/get_categories_cubit.dart';
import 'package:pos/features/categories/manager/get_categories/get_categories_state.dart';
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
        child: RefreshIndicator(
          onRefresh: ()async
          {
            return await GetCategoriesCubit.get(context).getCategories();
          },
          child: BlocBuilder<GetCategoriesCubit, GetCategoriesState>(
            builder: (context, state) {
              if (state is GetCategoriesLoading)
              {
                return const CustomLoading();
              }
              else if (state is GetCategoriesError)
              {
                return CustomError(error: state.error);
              }
              else if (state is GetCategoriesSuccess)
              {
                if(state.categories.isEmpty)
                {
                  return CustomEmptyData();
                }
                else
                {
                  return ListView.builder(
                    itemCount: state.categories.length,
                    itemBuilder: (context, index) {
                      return CategoryItemBuilder(
                        index: index,
                        category: state.categories[index]);
                    },
                  );
                }
              }
              else
              {
                return const SizedBox();
              }
            }
          ),
        ),
      ),
    );
  }
}
