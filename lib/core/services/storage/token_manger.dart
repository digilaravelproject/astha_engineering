import 'package:shared_preferences/shared_preferences.dart';
import 'package:astha_engineering/core/constants/app_constants.dart';

class TokenManager {
  final SharedPreferences sharedPreferences;

  TokenManager({required this.sharedPreferences});

  Future<bool> saveToken(String token) async {
    return await sharedPreferences.setString(AppConstants.tokenKey, token);
  }

  String? getToken() {
    return sharedPreferences.getString(AppConstants.tokenKey);
  }

  Future<bool> clearToken() async {
    return await sharedPreferences.remove(AppConstants.tokenKey);
  }
}
