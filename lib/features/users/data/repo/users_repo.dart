import 'package:dartz/dartz.dart';
import 'package:pos/features/permissions/data/models/permission_model.dart';

import '../models/user_model.dart';

class UsersRepo
{
  List<UserModel> users =
  [
    UserModel(
      id: 1,
      name: 'Ahmed',
      email: 'ahmed@gmail.com',
      phone: '01004383942',
      address: 'Cairo, Egypt',
      permission: PermissionModel.asAdmin(),
      image: 'https://www.hitsa.com.au/wp-content/uploads/types-of-chefs.jpg'
    ),
  ];

  Future<Either<String, List<UserModel>>> getUsers() async
  {
    try
    {
      return Right(users);
    }
    catch(e)
    {
      return Left(e.toString());
    }
  }

  Future<Either<String, void>> addUser({required UserModel user}) async
  {
    try
    {
      user.id = users.length + 1;
      users.add(user);
      return Right(null);
    }
    catch(e)
    {
      return Left(e.toString());
    }
  }

  Future<Either<String, void>> editUser({required UserModel newUser}) async
  {
    try
    {
      users[users.indexWhere((element) => element.id == newUser.id)] = newUser;
      return Right(null);
    }
    catch(e)
    {
      return Left(e.toString());
    }
  }

  Future<Either<String, void>> deleteUser({required UserModel user}) async
  {
    try
    {
      users.removeWhere((element) => element.id == user.id);
      return Right(null);
    }
    catch(e)
    {
      return Left(e.toString());
    }
  }
}