import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static SharedPreferences? sharedPreferences;

  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static putBoolean({required String key, required bool value}) async {
    sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences?.setBool('isDark', value);
  }

  static bool? getBoolean({required String key}) {

   return sharedPreferences?.getBool('isDark');
  }
}
