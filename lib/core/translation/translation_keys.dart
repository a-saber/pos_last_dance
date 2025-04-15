import 'dart:ui';

import 'package:pos/core/cache/cache_keys.dart';


abstract class TranslationsKeys {
  // languages locales
  static const Locale localeEN = Locale(CacheKeys.keyEN);
  static const Locale localeAR = Locale(CacheKeys.keyAR);

  // App Strings
  static const String login = 'login';
  static const String donTHaveAccount = 'donTHaveAccount';
  static const String alreadyHaveAccount = 'alreadyHaveAccount';
  static const String register = 'register';
  static const String registerSuccess = 'registerSuccess';
  static const String loginSuccess = 'loginSuccess';
  static const String addedSuccess = 'addedSuccess';
  static const String updatedSuccess = 'updatedSuccess';
  static const String deletedSuccess = 'deletedSuccess';
  static const String youHaveNoData = 'youHaveNoData';
  static const String areYouSureWantToDelete = 'Are you sure you want to delete';
  static const String cancel = 'cancel';
  static const String delete = 'delete';
  static const String add = 'add';
  static const String edit = 'edit';
  static const String search = 'search';
  static const String refresh = 'refresh';
  static const String selectImage = 'selectImage';


  // home
  static const String home = 'home';
  static const String sellingPoint = 'sellingPoint';

  // products
  static const String products = 'products';
  static const String addProduct = 'addProduct';
  static const String editProduct = 'editProduct';
  static const String deleteProduct = 'deleteProduct';

  // categories
  static const String categories = 'categories';
  static const String addCategory = 'addCategory';
  static const String editCategory = 'editCategory';
  static const String deleteCategory = 'deleteCategory';

  // users
  static const String users = 'users';
  static const String addUser = 'addUser';
  static const String editUser = 'editUser';
  static const String deleteUser = 'deleteUser';

  // permissions
  static const String permissions = 'permissions';
  static const String addPermission = 'addPermission';
  static const String editPermission = 'editPermission';
  static const String deletePermission = 'deletePermission';



  // data
  static const String email = 'email';
  static const String phone = 'phone';
  static const String name = 'name';
  static const String description = 'description';
  static const String showInSales = 'showInSales';
  static const String notShowInSales = 'notShowInSales';
  static const String orderNumber = 'orderNumber';


  static const String address = 'address';
  static const String password = 'password';
  static const String confirmPassword = 'confirmPassword';
}