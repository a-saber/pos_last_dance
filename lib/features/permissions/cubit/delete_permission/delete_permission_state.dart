sealed class DeletePermissionState {}

final class DeletePermissionInitial extends DeletePermissionState {}

final class DeletePermissionLoading extends DeletePermissionState {}

final class DeletePermissionError extends DeletePermissionState
{
  final String error;
  DeletePermissionError({required this.error});
}

final class DeletePermissionSuccess extends DeletePermissionState {}
