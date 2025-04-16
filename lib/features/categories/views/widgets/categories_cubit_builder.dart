import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos/core/widgets/custom_empty_data.dart';
import 'package:pos/core/widgets/custom_error.dart';
import 'package:pos/core/widgets/custom_loading.dart';
import 'package:pos/features/categories/data/models/category_model.dart';
import 'package:pos/features/categories/manager/get_categories/get_categories_cubit.dart';
import 'package:pos/features/categories/manager/get_categories/get_categories_state.dart';


class CategoriesCubitBuilder extends StatelessWidget {
  const CategoriesCubitBuilder({super.key, required this.categoryItemBuilder});

  final Widget Function(BuildContext context, List<CategoryModel> categories) categoryItemBuilder;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetCategoriesCubit, GetCategoriesState>(
        builder: (context, state) {
          if (state is GetCategoriesLoading)
          {
            return const CustomLoading();
          }
          else if (state is GetCategoriesError)
          {
            return CustomError(error: state.error,
              onPressed: GetCategoriesCubit.get(context).getCategories,
            );
          }
          else if (state is GetCategoriesSuccess)
          {
            if(state.categories.isEmpty)
            {
              return CustomEmptyData(
                onPressed: GetCategoriesCubit.get(context).getCategories,
              );
            }
            else
            {
              return categoryItemBuilder(context, state.categories);
            }
          }
          else
          {
            return const SizedBox();
          }
        }
    );
  }
}
