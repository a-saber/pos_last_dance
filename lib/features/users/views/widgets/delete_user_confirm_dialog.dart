import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:pos/core/helper/my_navigator.dart';
import 'package:pos/core/helper/service_loactor.dart';
import 'package:pos/core/translation/translation_keys.dart';
import 'package:pos/core/widgets/show_delete_confirm_dialog.dart';
import 'package:pos/features/users/cubit/delete_user/delete_user_cubit.dart';
import 'package:pos/features/users/cubit/delete_user/delete_user_state.dart';
import 'package:pos/features/users/cubit/get_users/get_users_cubit.dart';
import 'package:pos/features/users/data/models/user_model.dart';
import 'package:pos/features/users/data/repo/users_repo.dart';

Future<bool?> showDeleteUserConfirmDialog({required BuildContext context, required UserModel user,
bool goBack = false}) async
{
  return await showDeleteConfirmationDialog(
      context: context,
      title: TranslationsKeys.deleteUser.tr,
      content: user.name ?? '',
      deleteButtonBuilder: (ctx, button, loading) =>  BlocProvider(
        create: (context) => DeleteUserCubit(MyServiceLocator.getSingleton<UsersRepo>()),
        child: BlocConsumer<DeleteUserCubit, DeleteUserState>(
          listener: (context, state)
          {
            if (state is DeleteUserSuccess)
            {
              deleteConfirmationDialogSuccess(ctx);
              GetUsersCubit.get(context).getUsers();
              if(goBack)
              {
                MyNavigator.goBack();
              }
            }
            else if (state is DeleteUserError)
            {
              deleteConfirmationDialogError( ctx, state.error);
            }
          },
          builder: (context, state) {
            if (state is DeleteUserLoading)
            {
              return loading;
            }
            return button(onPressed: () => DeleteUserCubit.get(context).deleteUser(user: user));
          },
        ),
      )
  );

}