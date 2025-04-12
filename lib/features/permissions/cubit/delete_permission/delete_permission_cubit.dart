
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos/features/permissions/data/models/permission_model.dart';
import 'package:pos/features/permissions/data/repo/permissions_repo.dart';

import 'delete_permission_state.dart';

class DeletePermissionCubit extends Cubit<DeletePermissionState> {
  DeletePermissionCubit() : super(DeletePermissionInitial());
  static DeletePermissionCubit get(context) => BlocProvider.of(context);

  PermissionsRepo permissionsRepo = PermissionsRepo();

  Future<void> deletePermission({required PermissionModel permission}) async {
    emit(DeletePermissionLoading());
    final result = await permissionsRepo.deletePermission(permission: permission);
    result.fold((l) => emit(DeletePermissionError(error: l)), (r) => emit(DeletePermissionSuccess()));
  }
}
