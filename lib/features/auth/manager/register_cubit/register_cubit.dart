import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos/features/auth/data/repo/auth_repo.dart';
import 'package:pos/features/users/data/models/user_model.dart';

import 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());
  static RegisterCubit get(context) => BlocProvider.of(context);

  TextEditingController nameArController = TextEditingController();
  TextEditingController nameEnController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();

  bool obscurePassword = true;
  bool obscureConfirmPassword = true;

  AuthRepo authRepo = AuthRepo();
  void onRegisterPressed() async{
    if(!formKey.currentState!.validate())
    {
      return;
    }
    if(passwordController.text != passwordConfirmController.text)
    {
      emit(RegisterError(errorMessage: "Passwords don't match"));
      return;
    }
    emit(RegisterLoading());
    var response = await authRepo.register(
      user: UserModel(
        nameAr: nameArController.text,
        nameEn: nameEnController.text,
        phone: phoneController.text,
        email: emailController.text,
        password: passwordController.text,
        address: addressController.text
      )
    );
    response.fold(
          (l) => emit(RegisterError(errorMessage: l)),
          (r) => emit(RegisterSuccess()),
    );

  }

  void changePasswordObscureStatus()
  {
    obscurePassword = !obscurePassword;
    emit(ChangeObscureStatus());
  }
  void changeConfirmPasswordObscureStatus()
  {
    obscureConfirmPassword = !obscureConfirmPassword;
    emit(ChangeObscureStatus());
  }

}