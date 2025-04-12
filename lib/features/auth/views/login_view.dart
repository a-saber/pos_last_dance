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
import 'package:pos/features/auth/manager/login_cubit/login_cubit.dart';
import 'package:pos/features/auth/manager/login_cubit/login_state.dart';
import 'package:pos/features/auth/views/register_view.dart';
import 'package:pos/features/home/views/home_view.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: TranslationsKeys.login.tr),
      body: BlocProvider(
        create: (context) => LoginCubit(),
        child: Builder(builder: (context) {
          return Form(
            key: LoginCubit.get(context).formKey,
            child: MyCustomScrollView(
              child: Padding(
                padding: AppPaddings.defaultView,
                child: Column(
                  children: [
                    CustomFormField(
                      controller: LoginCubit.get(context).emailController,
                      validator: MyFormValidators.validateEmail,
                      labelText: TranslationsKeys.email.tr,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    BlocBuilder<LoginCubit, LoginState>(
                      builder: (context, state) {
                        return Column(
                          children: [
                            CustomFormField(
                              controller: LoginCubit.get(context).passwordController,
                              validator: MyFormValidators.validatePassword,
                              labelText: TranslationsKeys.password.tr,
                              suffixIcon: CustomObscureSuffixIcon(
                                onPressed: LoginCubit.get(context).changeObscurePassword,
                                isObscure: LoginCubit.get(context).obscurePassword,
                              ),
                              obscureText: LoginCubit.get(context).obscurePassword,
                            ),
                          ],
                        );
                      },
                    ),
        
                    SizedBox(
                      height: 40,
                    ),
                    BlocConsumer<LoginCubit, LoginState>(
                      listener: (context, state) {
                        if (state is LoginSuccess)
                        {
                          CustomPopUp.callMyToast(massage: TranslationsKeys.loginSuccess, state: PopUpState.SUCCESS);
                          MyNavigator.goTo(
                              destinationBuilder: ()=>HomeView(),
                              isReplace: true
                          );
                        }
                        else if (state is LoginError)
                        {
                          CustomPopUp.callMyToast(massage: state.errorMessage, state: PopUpState.ERROR);
                        }
                      },
                      builder: (context, state) {
                        if(state is LoginLoading)
                        {
                          return CustomLoading();
                        }
                        return SizedBox(
                          width: double.infinity,
                          child: CustomFilledBtn(
                            text: TranslationsKeys.login.tr,
                            onPressed: LoginCubit.get(context).onLoginPressed,
                          ),
                        );
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(TranslationsKeys.donTHaveAccount.tr),
                        SizedBox(
                          width: 5,
                        ),
                        TextButton(
                            onPressed: () {
                              MyNavigator.goTo(destinationBuilder: ()=>RegisterView());
                            },
                            child: Text(TranslationsKeys.register.tr.toUpperCase()))
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
