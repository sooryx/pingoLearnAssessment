import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesManager {
  static const String isLoggedInKey = 'is_logged_in';
  static const String userNameKey = 'user_name';
  static const String userEmailKey = 'user_email';

  SharedPreferencesManager._privateConstructor();

  static final SharedPreferencesManager _instance =
  SharedPreferencesManager._privateConstructor();

  factory SharedPreferencesManager() => _instance;

  SharedPreferences? _preferences;

  Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  Future<void> setLoggedIn(bool isLoggedIn) async {
    await _preferences?.setBool(isLoggedInKey, isLoggedIn);
  }

  bool get isLoggedIn {
    return _preferences?.getBool(isLoggedInKey) ?? false;
  }

  Future<void> storeLoginData({
    required String name,
    required String email,
  }) async {
    await _preferences?.setString(userNameKey, name);
    await _preferences?.setString(userEmailKey, email);
  }

  String? get userName {
    return _preferences?.getString(userNameKey);
  }

  String? get userEmail {
    return _preferences?.getString(userEmailKey);
  }

  Future<void> logout() async {
    await _preferences?.clear();
  }
}
