import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:pos/core/helper/my_navigator.dart';
import 'package:pos/core/helper/service_loactor.dart';
import 'package:pos/core/translation/translation_keys.dart';
import 'package:pos/core/widgets/custom_app_bar.dart';
import 'package:pos/core/widgets/custom_fields/custom_btn.dart';
import 'package:pos/core/widgets/custom_pop_up.dart';
import 'package:pos/features/users/cubit/edit_user/edit_user_cubit.dart';
import 'package:pos/features/users/cubit/edit_user/edit_user_state.dart';
import 'package:pos/features/users/cubit/get_users/get_users_cubit.dart';
import 'package:pos/features/users/data/models/user_model.dart';
import 'package:pos/features/users/data/repo/users_repo.dart';

import 'widgets/delete_user_confirm_dialog.dart';
import 'widgets/user_data_builder.dart';

class EditUserView extends StatelessWidget {
  const EditUserView({super.key, required this.userModel});

  final UserModel userModel;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EditUserCubit(MyServiceLocator.getSingleton<UsersRepo>(), UserModel.from(userModel)),
      child: Scaffold(
        appBar: CustomAppBar(title: TranslationsKeys.editUser.tr,
        actions:
        [
          CustomTextBtn(
            text: TranslationsKeys.delete.tr,
            onPressed: ()async
            {
              await showDeleteUserConfirmDialog(
                  context: context,
                  user: userModel,
                  goBack: true
              );
            }
          ),
        ],),
        body: BlocConsumer<EditUserCubit, EditUserState>(
          listener: (context, state)
          {
            if(state is EditUserSuccess)
            {
              GetUsersCubit.get(context).getUsers();
              CustomPopUp.callMyToast(context: context, massage: TranslationsKeys.updatedSuccess.tr, state: PopUpState.SUCCESS);
              MyNavigator.goBack();
            }
            else if(state is EditUserError)
            {
              CustomPopUp.callMyToast(context: context, massage: state.error, state: PopUpState.ERROR);
            }
          },
          builder: (context, state)
          {
            return UserDataBuilder(
              onSelectedImage: (image) => EditUserCubit.get(context).image = image,
              formKey: EditUserCubit.get(context).formKey,
              nameController: EditUserCubit.get(context).nameController,
              emailController: EditUserCubit.get(context).emailController,
              phoneController: EditUserCubit.get(context).phoneController,
              addressController: EditUserCubit.get(context).addressController,
              isLoading: state is EditUserLoading,
              onPressed: EditUserCubit.get(context).editUser,
              userModel: EditUserCubit.get(context).user,
              onChangedPermission: EditUserCubit.get(context).changeUserPermission,
              isEdit: true,
            );
          },
        ),
      ),
    );
  }
}
