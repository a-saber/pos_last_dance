import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:pos/core/helper/my_navigator.dart';
import 'package:pos/core/helper/service_loactor.dart';
import 'package:pos/core/translation/translation_keys.dart';
import 'package:pos/core/widgets/custom_app_bar.dart';
import 'package:pos/core/widgets/custom_pop_up.dart';
import 'package:pos/features/users/cubit/add_user/add_user_cubit.dart';
import 'package:pos/features/users/cubit/add_user/add_user_state.dart';
import 'package:pos/features/users/cubit/get_users/get_users_cubit.dart';
import 'package:pos/features/users/data/repo/users_repo.dart';

import 'widgets/user_data_builder.dart';

class AddUserView extends StatelessWidget {
  const AddUserView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddUserCubit(MyServiceLocator.getSingleton<UsersRepo>()),
      child: Scaffold(
        appBar: CustomAppBar(title: TranslationsKeys.addUser.tr),
        body: BlocConsumer<AddUserCubit, AddUserState>(
          listener: (context, state)
          {
            if(state is AddUserSuccess)
            {
              GetUsersCubit.get(context).getUsers();
              CustomPopUp.callMyToast(context: context, massage: TranslationsKeys.addedSuccess.tr, state: PopUpState.SUCCESS);
              MyNavigator.goBack();
            }
            else if(state is AddUserError)
            {
              CustomPopUp.callMyToast(context: context, massage: state.error, state: PopUpState.ERROR);
            }
          },
          builder: (context, state)
          {
            return UserDataBuilder(
              onSelectedImage: (image) => AddUserCubit.get(context).image = image,
              formKey: AddUserCubit.get(context).formKey,
              nameController: AddUserCubit.get(context).nameController,
              emailController: AddUserCubit.get(context).emailController,
              phoneController: AddUserCubit.get(context).phoneController,
              addressController: AddUserCubit.get(context).addressController,
              isLoading: state is AddUserLoading,
              onPressed: AddUserCubit.get(context).addUser,
              userModel: AddUserCubit.get(context).user,
              onChangedPermission: AddUserCubit.get(context).changeUserPermission,
              isEdit: false,
            );
          },
        ),
      )
    );
  }
}
