import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pos/core/helper/custom_validator.dart';
import 'package:pos/core/translation/translation_keys.dart';
import 'package:pos/core/utils/app_paddings.dart';
import 'package:pos/core/widgets/custom_fields/custom_btn.dart';
import 'package:pos/core/widgets/custom_fields/custom_form_field.dart';
import 'package:pos/core/widgets/custom_loading.dart';
import 'package:pos/core/widgets/image_manager/image_manager_view.dart';
import 'package:pos/core/widgets/my_custom_scroll_view.dart';
class CategoryDataBuilder extends StatelessWidget {
  const CategoryDataBuilder({super.key, required this.formKey, required this.nameController,
    required this.descriptionController, this.imageUrl, required this.onTap, required this.onSelected,
    required this.isLoading, required this.isEdit});

  final GlobalKey<FormState> formKey ;
  final TextEditingController nameController;
  final TextEditingController descriptionController;
  final String? imageUrl;
  final void Function() onTap;
  final void Function(XFile) onSelected;
  final bool isLoading ;
  final bool isEdit;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: MyCustomScrollView(
          child: Padding(
            padding: AppPaddings.defaultView,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children:
              [
                ImageManagerView(onSelected: onSelected, imageUrl: imageUrl),
                SizedBox(
                  height: 20,
                ),
                CustomFormField(
                  controller: nameController,
                  labelText: TranslationsKeys.name.tr,
                  validator: MyFormValidators.validateRequired,
                  keyboardType: TextInputType.name,
                ),
                SizedBox(
                  height: 20,
                ),
                CustomFormField(
                  controller: descriptionController,
                  labelText: TranslationsKeys.description.tr,
                ),
                SizedBox(
                  height: 20,
                ),
                Builder(builder: (context){
                  if (isLoading)
                  {
                    return const CustomLoading();
                  }
                  return CustomFilledBtn(
                      text: isEdit? TranslationsKeys.edit.tr : TranslationsKeys.add.tr,
                      onPressed: onTap
                  );
                })
              ],
            ),
          )
      ),
    );
  }
}
