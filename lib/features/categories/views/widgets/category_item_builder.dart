import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:pos/core/cache/cache_data.dart';
import 'package:pos/core/cache/cache_keys.dart';
import 'package:pos/core/translation/translation_keys.dart';
import 'package:pos/core/utils/app_colors.dart';
import 'package:pos/core/utils/app_transition.dart';
import 'package:pos/core/widgets/custom_network_image.dart';
import 'package:pos/core/widgets/custom_pop_up.dart';
import 'package:pos/core/widgets/show_delete_confirm_dialog.dart';
import 'package:pos/features/categories/data/models/category_model.dart';
import 'package:pos/features/categories/manager/delete_category/delete_category_cubit.dart';
import 'package:pos/features/categories/manager/delete_category/delete_category_state.dart';

class CategoryItemBuilder extends StatelessWidget {
  const CategoryItemBuilder({super.key, required this.category, required this.index});

  final CategoryModel category;
  final int index;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()
      {
        Get.to(() => Scaffold(),
            transition: AppTransition.defaultTransition,
            duration: AppDuration.defaultDuration
        );
      },
      child: Dismissible(
        onDismissed: (direction)
        {
          print("object");
        },
        confirmDismiss: (direction) async {
          return await showDeleteConfirmationDialog(
            context: context,
            title: TranslationsKeys.deleteCategory.tr,
            content: CacheData.lang == CacheKeys.keyEN ? category.nameEn ?? '' : category.nameAr ?? '',
            deleteButtonBuilder: (ctx, button, loading) =>  BlocProvider(
              create: (context) => DeleteCategoryCubit(),
              child: BlocConsumer<DeleteCategoryCubit, DeleteCategoryState>(
                listener: (context, state)
                {
                  if (state is DeleteCategorySuccess)
                  {
                    deleteConfirmationDialogSuccess(ctx);
                  }
                  else if (state is DeleteCategoryError)
                  {
                    deleteConfirmationDialogError(state.error);
                  }
                },
                builder: (context, state) {
                  if (state is DeleteCategoryLoading)
                  {
                    return loading;
                  }
                  return button(onPressed: () => DeleteCategoryCubit.get(context).deleteCategory(category: category, index: index));
                },
              ),
            )
          );
        },
        key: UniqueKey(),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: AppColors.primary.withAlpha(25),
                blurRadius: 7,
                blurStyle: BlurStyle.outer,
              ),
            ]
          ),
          child: Row(
            children:
            [

              // network image
              CustomCachedNetworkImage(
                width: 75,
                height: 75,
                imageUrl: category.imagePath??'',
                borderRadius: BorderRadius.circular(15),
                imageBuilder: (imageProvider)
                {
                  return Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover
                      )
                    ),
                  );
                },

              ),
              const SizedBox(width: 10,),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            CacheData.lang == CacheKeys.keyEN ?
                            category.nameEn ?? '' :
                            category.nameAr ?? '',
                          ),
                        ),
                        const SizedBox(width: 10,),
                        Text(
                          '${category.orderNumber??''}',
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    if(category.showInSales??false)
                      Row(
                        children:
                        [
                          Icon(Icons.check_circle_outline, color: AppColors.primary, size: 20,),
                          SizedBox(width: 5,),
                          Text(TranslationsKeys.showInSales.tr)
                        ],
                      )
                    else
                      Row(
                        children:
                        [
                          Icon(Icons.cancel_outlined, color: AppColors.error, size: 20,),
                          SizedBox(width: 5,),
                          Text(TranslationsKeys.notShowInSales.tr)
                        ],
                      )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
