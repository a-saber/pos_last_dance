
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos/features/permissions/data/models/permission_model.dart';
import 'package:pos/features/permissions/data/repo/permissions_repo.dart';

import 'edit_permission_state.dart';

class EditPermissionCubit extends Cubit<EditPermissionState> {
  EditPermissionCubit() : super(EditPermissionInitial());
  static EditPermissionCubit get(context) => BlocProvider.of(context);

  PermissionsRepo permissionsRepo = PermissionsRepo();

  TextEditingController nameArController = TextEditingController();
  TextEditingController nameEnController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<void> editPermission({required PermissionModel permission}) async {
    if(!formKey.currentState!.validate()) return;

    permission.nameAr = nameArController.text;
    permission.nameEn = nameEnController.text;
    permission.description = descriptionController.text;
    emit(EditPermissionLoading());
    final result = await permissionsRepo.editPermission(newPermission: permission);
    result.fold((l) => emit(EditPermissionError(error: l)), (r) => emit(EditPermissionSuccess()));
  }
}
