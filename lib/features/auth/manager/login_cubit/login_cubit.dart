import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos/features/auth/data/repo/auth_repo.dart';

import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  static LoginCubit get(context) => BlocProvider.of(context);

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();

  AuthRepo authRepo = AuthRepo();

  void onLoginPressed() async{
    if(formKey.currentState!.validate())
    {
      emit(LoginLoading());
      var response = await authRepo.login(
        email: emailController.text,
        password: passwordController.text
      );
      response.fold(
        (l) => emit(LoginError(errorMessage: l)),
        (r) => emit(LoginSuccess(user: r)),
      );

    }

  }

  bool obscurePassword = true;

  void changeObscurePassword()
  {
    obscurePassword = !obscurePassword;
    emit(LoginChangeObscure());
  }
}