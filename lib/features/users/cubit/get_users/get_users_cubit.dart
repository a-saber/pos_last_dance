import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos/features/users/data/repo/users_repo.dart';

import 'get_users_state.dart';

class GetUsersCubit extends Cubit<GetUsersState> {
  GetUsersCubit(this.usersRepo) : super(GetUsersInitial());

  static GetUsersCubit get(context) => BlocProvider.of(context);

  UsersRepo usersRepo ;

  Future<void> getUsers() async {
    print('call getUsers . . .');
    emit(GetUsersLoading());
    final result = await usersRepo.getUsers();
    result.fold((l) => emit(GetUsersError(error: l)),
        (users) => emit(GetUsersSuccess(users: users)));
  }
}
