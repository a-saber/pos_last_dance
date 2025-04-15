sealed class AddUserState {}

final class AddUserInitial extends AddUserState {}

final class AddUserLoading extends AddUserState {}

final class AddUserError extends AddUserState
{
  final String error;
  AddUserError({required this.error});
}

final class AddUserSuccess extends AddUserState {}

final class AddUserChangePermission extends AddUserState {}
