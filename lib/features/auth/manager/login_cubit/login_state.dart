import 'package:pos/features/users/data/models/user_model.dart';

abstract class LoginState {}
class LoginInitial extends LoginState {}
class LoginLoading extends LoginState {}
class LoginSuccess extends LoginState
{
  UserModel user;
  LoginSuccess({required this.user});
}
class LoginError extends LoginState
{
  String errorMessage;
  LoginError({required this.errorMessage});
}

class LoginChangeObscure extends LoginState {}

