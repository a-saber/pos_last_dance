import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:pos/core/helper/custom_validator.dart';
import 'package:pos/core/helper/my_navigator.dart';
import 'package:pos/core/translation/translation_keys.dart';
import 'package:pos/core/utils/app_paddings.dart';
import 'package:pos/core/widgets/custom_app_bar.dart';
import 'package:pos/core/widgets/custom_fields/custom_btn.dart';
import 'package:pos/core/widgets/custom_fields/custom_form_field.dart';
import 'package:pos/core/widgets/custom_fields/custom_obscure_suffix_icon.dart';
import 'package:pos/core/widgets/custom_loading.dart';
import 'package:pos/core/widgets/custom_pop_up.dart';
import 'package:pos/core/widgets/my_custom_scroll_view.dart';
import 'package:pos/features/auth/manager/register_cubit/register_cubit.dart';
import 'package:pos/features/auth/manager/register_cubit/register_state.dart';
import 'package:pos/features/auth/views/login_view.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: TranslationsKeys.register),
      body: BlocProvider(
        create: (context) => RegisterCubit(),
        child: Builder(builder: (context) {
          return Form(
            key: RegisterCubit.get(context).formKey,
            child: MyCustomScrollView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              child: Padding(
                padding: AppPaddings.defaultView,
                child: Column(
                  children: [
                    CustomFormField(
                      controller: RegisterCubit.get(context).nameArController,
                      validator: MyFormValidators.validateRequired,
                      labelText: TranslationsKeys.nameAr.tr,
                      keyboardType: TextInputType.name,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CustomFormField(
                      controller: RegisterCubit.get(context).nameEnController,
                      validator: MyFormValidators.validateRequired,
                      labelText: TranslationsKeys.nameEn.tr,
                      keyboardType: TextInputType.name,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CustomFormField(
                      controller: RegisterCubit.get(context).phoneController,
                      validator: MyFormValidators.validatePhone,
                      labelText: TranslationsKeys.phone.tr,
                      keyboardType: TextInputType.phone,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CustomFormField(
                      controller: RegisterCubit.get(context).emailController,
                      validator: MyFormValidators.validateEmail,
                      labelText: TranslationsKeys.email.tr,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CustomFormField(
                      controller: RegisterCubit.get(context).addressController,
                      validator: MyFormValidators.validateRequired,
                      labelText: TranslationsKeys.address.tr,
                      keyboardType: TextInputType.streetAddress,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    BlocBuilder<RegisterCubit, RegisterState>(
                      builder: (context, state) {
                        return Column(
                          children: [
                            CustomFormField(
                              controller:
                                  RegisterCubit.get(context).passwordController,
                              validator: MyFormValidators.validatePassword,
                              labelText: TranslationsKeys.password.tr,
                              suffixIcon: CustomObscureSuffixIcon(
                                onPressed: RegisterCubit.get(context).changePasswordObscureStatus,
                                isObscure: RegisterCubit.get(context).obscurePassword,
                              ),
                              obscureText: RegisterCubit.get(context).obscurePassword,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            CustomFormField(
                              controller: RegisterCubit.get(context).passwordConfirmController,
                              validator: MyFormValidators.validatePassword,
                              labelText: TranslationsKeys.confirmPassword.tr,
                              suffixIcon: CustomObscureSuffixIcon(
                                onPressed: RegisterCubit.get(context).changeConfirmPasswordObscureStatus,
                                isObscure: RegisterCubit.get(context).obscureConfirmPassword,
                              ),
                              obscureText: RegisterCubit.get(context).obscureConfirmPassword,
                            ),
                          ],
                        );
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    BlocConsumer<RegisterCubit, RegisterState>(
                      listener: (context, state) {
                        if(state is RegisterSuccess)
                        {
                          MyNavigator.goTo(
                              destinationBuilder: () => LoginView(),
                              isReplace: true
                          );
                          CustomPopUp.callMyToast(massage: TranslationsKeys.registerSuccess, state: PopUpState.SUCCESS);
                        }
                        else if(state is RegisterError)
                        {
                          CustomPopUp.callMyToast(massage: state.errorMessage, state: PopUpState.ERROR);
                        }
                      },
                      builder: (context, state) {
                        if(state is RegisterLoading)
                        {
                          return CustomLoading();
                        }
                        return SizedBox(
                          width: double.infinity,
                          child: CustomFilledBtn(
                            text: TranslationsKeys.register.tr,
                            onPressed: RegisterCubit.get(context).onRegisterPressed,
                          ),
                        );
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(TranslationsKeys.alreadyHaveAccount.tr),
                        SizedBox(
                          width: 5,
                        ),
                        TextButton(
                            onPressed: () {
                              Get.back();
                            },
                            child:
                                Text(TranslationsKeys.login.tr.toUpperCase()))
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
