import 'package:get_it/get_it.dart';
import 'package:pos/features/categories/data/repo/category_repo.dart';
import 'package:pos/features/permissions/data/repo/permissions_repo.dart';
import 'package:pos/features/users/data/repo/users_repo.dart';

class MyServiceLocator {
  static final GetIt _getIt = GetIt.instance;

  static void init() {
    registerSingleton<PermissionsRepo>(PermissionsRepo());
    registerSingleton<CategoryRepo>(CategoryRepo());
    registerSingleton<UsersRepo>(UsersRepo());
  }

  static void registerSingleton<T extends Object>(T instance) {
    _getIt.registerSingleton<T>(instance);
  }

  static T getSingleton<T extends Object>() {
    return _getIt.get<T>();
  }
}
