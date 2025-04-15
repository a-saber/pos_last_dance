import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos/core/helper/custom_validator.dart';
import 'package:pos/core/translation/translation_keys.dart';
import 'package:pos/core/utils/app_paddings.dart';
import 'package:pos/core/widgets/custom_fields/custom_btn.dart';
import 'package:pos/core/widgets/custom_fields/custom_check_box.dart';
import 'package:pos/core/widgets/custom_fields/custom_form_field.dart';
import 'package:pos/core/widgets/custom_loading.dart';
import 'package:pos/core/widgets/my_custom_scroll_view.dart';
import 'package:pos/features/permissions/data/models/permission_model.dart';

class PermissionDataBuilder extends StatelessWidget {
  const PermissionDataBuilder(
      {super.key,
      required this.formKey,
      required this.nameController,
      required this.descriptionController,
      required this.isLoading,
      required this.onPressed,
      required this.permission, required this.onChanged, required this.isEdit
      });

  final GlobalKey<FormState> formKey;
  final TextEditingController nameController;
  final TextEditingController descriptionController;
  final bool isLoading;
  final void Function() onPressed;
  final PermissionModel permission;
  final void Function(bool, int) onChanged;
  final bool isEdit;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Padding(
        padding: AppPaddings.defaultView,
        child: Column(
          children: [
            Expanded(
              child: MyCustomScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                      height: 10,
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
                      keyboardType: TextInputType.text,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ListView.separated(
                      separatorBuilder: (context, index) => const SizedBox(
                        height: 20,
                      ),
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: permission.items.length,
                      itemBuilder: (context, index) {
                        return CustomCheckbox(
                          title: permission.items[index].name??'-',
                          value: permission.items[index].isSelected,
                          onChanged: (bool? value) {
                            if (value != null) {
                              onChanged(value, index);
                            }
                          }
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            Builder(builder: (context) {
              if (isLoading) {
                return const CustomLoading();
              }
              return CustomFilledBtn(
                  text: isEdit ? TranslationsKeys.edit.tr : TranslationsKeys.add.tr,
                  onPressed: onPressed
              );
            }),
          ],
        ),
      ),
    );
  }
}
