import 'package:pos/features/users/data/models/user_model.dart';

sealed class GetUsersState {}

final class GetUsersInitial extends GetUsersState {}

final class GetUsersLoading extends GetUsersState {}

final class GetUsersError extends GetUsersState
{
  final String error;
  GetUsersError({required this.error});
}

final class GetUsersSuccess extends GetUsersState
{
  final List<UserModel> users;
  GetUsersSuccess({required this.users});
}
