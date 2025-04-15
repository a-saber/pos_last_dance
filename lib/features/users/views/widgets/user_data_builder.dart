import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pos/core/helper/custom_validator.dart';
import 'package:pos/core/translation/translation_keys.dart';
import 'package:pos/core/utils/app_paddings.dart';
import 'package:pos/core/utils/app_text_styles.dart';
import 'package:pos/core/widgets/custom_fields/custom_btn.dart';
import 'package:pos/core/widgets/custom_fields/custom_drop_down.dart';
import 'package:pos/core/widgets/custom_fields/custom_form_field.dart';
import 'package:pos/core/widgets/custom_loading.dart';
import 'package:pos/core/widgets/image_manager/image_manager_view.dart';
import 'package:pos/core/widgets/my_custom_scroll_view.dart';
import 'package:pos/features/permissions/data/models/permission_model.dart';
import 'package:pos/features/permissions/views/widgets/permissions_cubit_builder.dart';
import 'package:pos/features/users/data/models/user_model.dart';

class UserDataBuilder extends StatelessWidget {
  const UserDataBuilder({super.key, required this.formKey, required this.nameController,
    required this.emailController, required this.phoneController, required this.addressController,
    required this.isLoading, required this.onPressed,
    required this.onChangedPermission, required this.isEdit, required this.userModel,
    required this.onSelectedImage});

  final GlobalKey<FormState> formKey;
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController phoneController;
  final TextEditingController addressController;
  final bool isLoading;
  final void Function() onPressed;
  final void Function(PermissionModel) onChangedPermission;
  final void Function(XFile) onSelectedImage;
  final bool isEdit;
  final UserModel userModel;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Padding(
        padding: AppPaddings.defaultView,
        child: MyCustomScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children:
            [
              ImageManagerView( onSelected: onSelectedImage, imageUrl: userModel.image, ),
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
                controller: emailController,
                labelText: TranslationsKeys.email.tr,
                keyboardType: TextInputType.emailAddress,
                validator: MyFormValidators.validateEmail,
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
                controller: addressController,
                labelText: TranslationsKeys.address.tr,
                keyboardType: TextInputType.streetAddress,
              ),
              SizedBox(
                height: 20,
              ),
          PermissionsCubitBuilder(permissionItemBuilder: (context, permissions) {
            return CustomDropdown<PermissionModel>(
              search: true,
              compareFn: (item1, item2)
              {
                if(item1.name == null || item2.name == null)
                {
                  return false;
                }
                else
                {
                  return (item1.name!.toLowerCase().contains(item2.name!.toLowerCase()) || item2.name!.toLowerCase().contains(item1.name!.toLowerCase()));
                }
              },
              validator: (value) => MyFormValidators.validateTypeRequired<PermissionModel>(value),
              value: userModel.permission,
              items: permissions,
              filterFn: (item, filter) {
                return item.name?.toLowerCase().contains(filter.toLowerCase()) ?? false;
              },
              onChanged: (PermissionModel? permission)
              {
                if(permission != null)
                {
                  onChangedPermission(permission);
                }
              },
              builder: (PermissionModel? permission)
              {
                if(permission != null)
                {
                  return Text(permission.name??'-',
                    style: AppTextStyles.formText(),);
                }
                else
                {
                  return SizedBox();
                }
              },
            );

          },),
              SizedBox(
                height: 20,
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
      ),
    );
  }
}
