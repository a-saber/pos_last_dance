
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pos/features/users/data/models/user_model.dart';
import 'package:pos/features/permissions/data/models/permission_model.dart';
import 'package:pos/features/users/data/repo/users_repo.dart';

import 'add_user_state.dart';

class AddUserCubit extends Cubit<AddUserState> {
  AddUserCubit(this.usersRepo) : super(AddUserInitial());
  static AddUserCubit get(context) => BlocProvider.of(context);
  UsersRepo usersRepo ;

  void changeUserPermission(PermissionModel newPermission)
  {
    user.permission = newPermission;
    emit(AddUserChangePermission());
  }

  UserModel user = UserModel();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  XFile? image;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<void> addUser() async {
    if(!formKey.currentState!.validate()) return;

    user.name = nameController.text;
    user.email = emailController.text;
    user.phone = phoneController.text;
    user.address = addressController.text;
    user.image = image?.path;
    emit(AddUserLoading());
    final result = await usersRepo.addUser(user: user);
    result.fold((l) => emit(AddUserError(error: l)), (r) => emit(AddUserSuccess()));
  }
}
