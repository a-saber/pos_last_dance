
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos/features/permissions/data/models/permission_model.dart';
import 'package:pos/features/permissions/data/repo/permissions_repo.dart';

import 'add_permission_state.dart';

class AddPermissionCubit extends Cubit<AddPermissionState> {
  AddPermissionCubit(this.permissionsRepo) : super(AddPermissionInitial());
  static AddPermissionCubit get(context) => BlocProvider.of(context);

  PermissionsRepo permissionsRepo ;

  void changePermissionStatus({required int index, required bool status})
  {
    permission.items[index].isSelected = status;
    emit(AddPermissionChangePermissionStatus());

  }

  PermissionModel permission = PermissionModel();
  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  Future<void> addPermission() async {
    if(!formKey.currentState!.validate()) return;

    permission.name = nameController.text;
    permission.description = descriptionController.text;
    emit(AddPermissionLoading());
    final result = await permissionsRepo.addPermission(permission: permission);
    result.fold((l) => emit(AddPermissionError(error: l)), (r) => emit(AddPermissionSuccess()));
  }
}
