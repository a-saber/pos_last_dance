
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos/features/users/data/models/user_model.dart';
import 'package:pos/features/users/data/repo/users_repo.dart';

import 'delete_user_state.dart';

class DeleteUserCubit extends Cubit<DeleteUserState> {
  DeleteUserCubit(this.usersRepo) : super(DeleteUserInitial());
  static DeleteUserCubit get(context) => BlocProvider.of(context);

  UsersRepo usersRepo;

  Future<void> deleteUser({required UserModel user}) async {
    emit(DeleteUserLoading());
    final result = await usersRepo.deleteUser(user: user);
    result.fold((l) => emit(DeleteUserError(error: l)), (r) => emit(DeleteUserSuccess()));
  }
}
