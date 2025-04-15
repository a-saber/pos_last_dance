import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos/features/permissions/data/repo/permissions_repo.dart';

import 'get_permissions_state.dart';

class GetPermissionsCubit extends Cubit<GetPermissionsState> {
  GetPermissionsCubit(this.permissionsRepo) : super(GetPermissionsInitial());

  static GetPermissionsCubit get(context) => BlocProvider.of(context);

  PermissionsRepo permissionsRepo ;

  Future<void> getPermissions() async {
    print('call getPermissions . . .');
    emit(GetPermissionsLoading());
    final result = await permissionsRepo.getPermissions();
    result.fold((l) => emit(GetPermissionsError(error: l)),
        (permissions) => emit(GetPermissionsSuccess(permissions: permissions)));
  }
}
