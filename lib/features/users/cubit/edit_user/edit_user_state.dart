sealed class EditUserState {}

final class EditUserInitial extends EditUserState {}

final class EditUserLoading extends EditUserState {}

final class EditUserError extends EditUserState
{
  final String error;
  EditUserError({required this.error});
}

final class EditUserSuccess extends EditUserState {}

final class EditUserChangePermission extends EditUserState {}
