sealed class DeleteUserState {}

final class DeleteUserInitial extends DeleteUserState {}

final class DeleteUserLoading extends DeleteUserState {}

final class DeleteUserError extends DeleteUserState
{
  final String error;
  DeleteUserError({required this.error});
}

final class DeleteUserSuccess extends DeleteUserState {}
