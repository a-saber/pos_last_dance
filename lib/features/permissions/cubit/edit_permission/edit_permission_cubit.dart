
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos/features/permissions/data/models/permission_model.dart';
import 'package:pos/features/permissions/data/repo/permissions_repo.dart';

import 'edit_permission_state.dart';

class EditPermissionCubit extends Cubit<EditPermissionState> {
  EditPermissionCubit(this.permissionsRepo, this.permission) : super(EditPermissionInitial())
  {
    nameController.text = permission.name??'';
    descriptionController.text = permission.description??'';
  }
  static EditPermissionCubit get(context) => BlocProvider.of(context);

  PermissionsRepo permissionsRepo ;
  PermissionModel permission ;

  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void changePermissionStatus({required int index, required bool status})
  {
    permission.items[index].isSelected = status;
    emit(EditPermissionChangePermissionStatus());

  }
  Future<void> editPermission() async {
    if(!formKey.currentState!.validate()) return;

    permission.name = nameController.text;
    permission.description = descriptionController.text;
    print(permission.name);
    emit(EditPermissionLoading());
    final result = await permissionsRepo.editPermission(newPermission: permission);
    result.fold((l) => emit(EditPermissionError(error: l)), (r) => emit(EditPermissionSuccess()));
  }
}
