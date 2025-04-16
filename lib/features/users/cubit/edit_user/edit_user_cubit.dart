
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pos/features/permissions/data/models/permission_model.dart';
import 'package:pos/features/users/data/models/user_model.dart';
import 'package:pos/features/users/data/repo/users_repo.dart';

import 'edit_user_state.dart';

class EditUserCubit extends Cubit<EditUserState> {
  EditUserCubit(this.usersRepo, this.user) : super(EditUserInitial())
  {
    nameController.text = user.name??'';
    emailController.text = user.email??'';
    phoneController.text = user.phone??'';
    addressController.text = user.address??'';
  }
  static EditUserCubit get(context) => BlocProvider.of(context);
  UsersRepo usersRepo ;
  UserModel user ;

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  XFile? image;

  void changeUserPermission( PermissionModel newPermission)
  {
    user.permission = newPermission;
    emit(EditUserChangePermission());
  }

  Future<void> editUser() async {
    if(!formKey.currentState!.validate()) return;

    user.name = nameController.text;
    user.phone = phoneController.text;
    user.email = emailController.text;
    user.address = addressController.text;
    if(image != null) user.image = image?.path;
    emit(EditUserLoading());
    final result = await usersRepo.editUser(newUser: user);
    result.fold((l) => emit(EditUserError(error: l)), (r) => emit(EditUserSuccess()));
  }
}
