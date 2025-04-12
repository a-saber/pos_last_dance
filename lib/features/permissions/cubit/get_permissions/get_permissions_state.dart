import 'package:pos/features/permissions/data/models/permission_model.dart';

sealed class GetPermissionsState {}

final class GetPermissionsInitial extends GetPermissionsState {}

final class GetPermissionsLoading extends GetPermissionsState {}

final class GetPermissionsError extends GetPermissionsState
{
  final String error;
  GetPermissionsError({required this.error});
}

final class GetPermissionsSuccess extends GetPermissionsState
{
  final List<PermissionModel> permissions;
  GetPermissionsSuccess({required this.permissions});
}
