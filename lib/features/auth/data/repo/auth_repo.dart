import 'package:dartz/dartz.dart';
import 'package:pos/core/cache/cache_helper.dart';
import 'package:pos/core/cache/cache_keys.dart';
import 'package:pos/core/network/api_response.dart';

import 'package:pos/features/users/data/models/user_model.dart';

class AuthRepo {
  // singleton
  static AuthRepo? _instance ;
  factory AuthRepo() {
    _instance ??= AuthRepo._internal();
    return _instance!;
  }
  AuthRepo._internal();


  UserModel? user;
  Future<Either<String, void>> register(
      {required UserModel user}) async
  {
    try {
      // TODO: implement register
      this.user = user;
      return Right(null);
    }
    catch (e) {
      return Left(ApiResponse.fromError(e).message);
    }
  }
  Future<Either<String, UserModel>> login(
      {required String email, required String password}) async
  {
    try {
      // TODO: implement login
      if (user!= null)
      {
        if (user!.email == email.trim() && user!.password == password.trim())
        {
          CacheHelper.saveData(key: CacheKeys.accessToken, value: user!.email);
          return Right(user!);
        }
        else
        {
          return Left("Wrong email or password");
        }
      }
      else
      {
        return Left("Register first");
      }
    }
    catch (e) {
      return Left(ApiResponse.fromError(e).message);
    }
  }

}
