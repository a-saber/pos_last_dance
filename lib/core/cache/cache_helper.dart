import 'package:shared_preferences/shared_preferences.dart';

import 'cache_data.dart';
import 'cache_keys.dart';

class CacheHelper {

  static late SharedPreferences sharedPreferences;
  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
    CacheData.accessToken = CacheHelper.getData(key: CacheKeys.accessToken);
    CacheData.refreshToken = CacheHelper.getData(key: CacheKeys.refreshToken);
  }

  static Future<bool> saveData({
    required String key,
    required dynamic value,
  }) async {
    if (value is String) {
      return await sharedPreferences.setString(key, value);
    }
    if (value is int) {
      return await sharedPreferences.setInt(key, value);
    }
    if (value is bool) {
      return await sharedPreferences.setBool(key, value);
    }

    return await sharedPreferences.setDouble(key, value);
  }

  static dynamic getData({required String key}) {
    return sharedPreferences.get(key);
  }

  static Future<bool> removeData({required String key}) async {
    return await sharedPreferences.remove(key);
  }
}