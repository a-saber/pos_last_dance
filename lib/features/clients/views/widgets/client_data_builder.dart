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

class ClientDataBuilder extends StatelessWidget {
  const ClientDataBuilder({super.key, required this.formKey, required this.nameController,
    required this.emailController, required this.phoneController, required this.addressController,
    required this.isLoading, required this.onPressed,
    required this.isEdit, this.imageUrl,
    required this.onSelectedImage, required this.commercialRegisterController,
    required this.taxIdentificationNumberController,
    required this.noteController});

  final GlobalKey<FormState> formKey;
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController phoneController;
  final TextEditingController addressController;
  final TextEditingController commercialRegisterController;
  final TextEditingController taxIdentificationNumberController;
  final TextEditingController noteController;

  final bool isLoading;
  final void Function() onPressed;
  final void Function(XFile) onSelectedImage;
  final bool isEdit;
  final String? imageUrl;

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
                  children:
                  [
                    ImageManagerView( onSelected: onSelectedImage, imageUrl: imageUrl ),
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
                      controller: phoneController,
                      labelText: TranslationsKeys.phone.tr,
                      keyboardType: TextInputType.phone,
                      validator: MyFormValidators.validatePhone,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CustomFormField(
                      controller: emailController,
                      labelText: TranslationsKeys.email.tr,
                      keyboardType: TextInputType.emailAddress,
                      validator: (String? value) => MyFormValidators.validateEmail(value, validateEmpty: false),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CustomFormField(
                      controller: addressController,
                      labelText: TranslationsKeys.address.tr,
                      keyboardType: TextInputType.streetAddress,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CustomFormField(
                      controller: commercialRegisterController,
                      labelText: TranslationsKeys.commercialRegister.tr,
                      validator: (String? value)=>MyFormValidators.validateInteger(value, validateEmpty: false),
                      keyboardType: TextInputType.number,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CustomFormField(
                      controller: taxIdentificationNumberController,
                      labelText: TranslationsKeys.taxIdentificationNumber.tr,
                      keyboardType: TextInputType.number,
                      validator: (String? value)=>MyFormValidators.validateInteger(value, validateEmpty: false),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CustomFormField(
                      controller: noteController,
                      labelText: TranslationsKeys.note.tr,
                      keyboardType: TextInputType.text,
                    ),
                    SizedBox(
                      height: 50,
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
