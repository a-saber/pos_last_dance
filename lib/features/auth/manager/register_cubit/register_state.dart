abstract class RegisterState {}
class RegisterInitial extends RegisterState {}
class RegisterLoading extends RegisterState {}
class RegisterSuccess extends RegisterState {}
class RegisterError extends RegisterState
{
  String errorMessage;
  RegisterError({required this.errorMessage});
}

class ChangeObscureStatus extends RegisterState {}
