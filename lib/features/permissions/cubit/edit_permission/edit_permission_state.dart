sealed class EditPermissionState {}

final class EditPermissionInitial extends EditPermissionState {}

final class EditPermissionLoading extends EditPermissionState {}

final class EditPermissionError extends EditPermissionState
{
  final String error;
  EditPermissionError({required this.error});
}

final class EditPermissionSuccess extends EditPermissionState {}
