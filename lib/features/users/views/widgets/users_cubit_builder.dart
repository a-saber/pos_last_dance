import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos/core/widgets/custom_empty_data.dart';
import 'package:pos/core/widgets/custom_error.dart';
import 'package:pos/core/widgets/custom_loading.dart';
import 'package:pos/features/users/cubit/get_users/get_users_cubit.dart';
import 'package:pos/features/users/cubit/get_users/get_users_state.dart';
import 'package:pos/features/users/data/models/user_model.dart';

class UsersCubitBuilder extends StatelessWidget {
  const UsersCubitBuilder({super.key, required this.usersBuilder});
  final Widget Function(BuildContext context, List<UserModel> users) usersBuilder;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetUsersCubit, GetUsersState>(
      builder: (context, state)
      {
        if(state is GetUsersLoading)
        {
          return const CustomLoading();
        }
        else if (state is GetUsersError)
        {
          return CustomError(error: state.error,
            onPressed: GetUsersCubit.get(context).getUsers,
          );
        }
        else if (state is GetUsersSuccess)
        {
          if(state.users.isEmpty)
          {
            return CustomEmptyData(
              onPressed: GetUsersCubit.get(context).getUsers,
            );
          }
          else
          {
            return usersBuilder(context, state.users);
          }
        }
        else
        {
          return const SizedBox();
        }
      }
    );
  }
}
