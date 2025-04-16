import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos/core/utils/app_colors.dart';
import 'package:pos/core/utils/app_text_styles.dart';
import 'package:pos/core/utils/app_transition.dart';
import 'package:pos/core/widgets/custom_network_image.dart';
import 'package:pos/features/categories/data/models/category_model.dart';

import 'delete_category_confirm_dialog.dart';

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
          return await  showDeleteCategoryConfirmDialog(context: context, category: category);
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
                    Text(
                     category.name??'',
                      style: AppTextStyles.itemsTitle(),
                    ),
                    if(category.description != null && category.description!.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Text(
                        category.description??'',
                        style: TextStyle(
                          overflow: TextOverflow.ellipsis,
                        ),
                        maxLines: 1,
                      ),
                    ),
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
