sealed class AddPermissionState {}

final class AddPermissionInitial extends AddPermissionState {}

final class AddPermissionLoading extends AddPermissionState {}

final class AddPermissionError extends AddPermissionState
{
  final String error;
  AddPermissionError({required this.error});
}

final class AddPermissionSuccess extends AddPermissionState {}

final class AddPermissionChangePermissionStatus extends AddPermissionState {}
