import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../presentations/resources/language_manager.dart';


class CasheNetwork{
  static late SharedPreferences sharedPref;
  static Future Cacheinitialization()async{
    sharedPref = await SharedPreferences.getInstance();
  }
  static Future<bool> insertToCache( {required String key ,required String value})async{
    return await  sharedPref.setString(key, value);
  }
  static String getCacheData({required String key}){
    return sharedPref.getString(key)??"";
  }
  static Future<bool> deleteCacheItem({required String key})async{
    return await sharedPref.remove(key);
  }
}
const String PREFS_KEY_LANG = "PREFS_KEY_LANG";
// const String PREFS_KEY_ONBOARDING_SCREEN_VIEWED =
//     "PREFS_KEY_ONBOARDING_SCREEN_VIEWED";
// const String PREFS_KEY_IS_USER_LOGGED_IN = "PREFS_KEY_IS_USER_LOGGED_IN";
class AppPreferences {
  final SharedPreferences _sharedPreferences;
  AppPreferences(this._sharedPreferences);
  Future<String> getAppLanguage() async {
    String? language = _sharedPreferences.getString(PREFS_KEY_LANG);
    if (language != null && language.isNotEmpty) {
      return language;
    } else {
      // return default lang
      return LanguageType.ENGLISH.getValue();
    }
  }

  Future<void> changeAppLanguage() async {
    String currentLang = await getAppLanguage();

    if (currentLang == LanguageType.ARABIC.getValue()) {
      // set english
      _sharedPreferences.setString(
          PREFS_KEY_LANG, LanguageType.ENGLISH.getValue());
    } else {
      // set arabic
      _sharedPreferences.setString(
          PREFS_KEY_LANG, LanguageType.ARABIC.getValue());
    }
  }

  Future<Locale> getLocal() async {
    String currentLang = await getAppLanguage();

    if (currentLang == LanguageType.ARABIC.getValue()) {
      return ARABIC_LOCAL;
    } else {
      return ENGLISH_LOCAL;
    }
  }
//
//   // on boarding
//
//   Future<void> setOnBoardingScreenViewed() async {
//     _sharedPreferences.setBool(PREFS_KEY_ONBOARDING_SCREEN_VIEWED, true);
//   }
//   Future<bool> isOnBoardingScreenViewed() async {
//     return _sharedPreferences.getBool(PREFS_KEY_ONBOARDING_SCREEN_VIEWED) ??
//         false;
//   }
//   //login
//   Future<void> setUserLoggedIn() async {
//     _sharedPreferences.setBool(PREFS_KEY_IS_USER_LOGGED_IN, true);
//   }
//   Future<bool> isUserLoggedIn() async {
//     return _sharedPreferences.getBool(PREFS_KEY_IS_USER_LOGGED_IN) ?? false;
//   }
//   Future<void> logout() async {
//     _sharedPreferences.remove(PREFS_KEY_IS_USER_LOGGED_IN);
//   }
}
//-------------------------------------------------------------------------------------------------------------------
class TokenCache with ChangeNotifier {
  String? _token;
  String? get token => _token;

  Future<void> setToken(String token) async {
    _token = token;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
    notifyListeners();
  }

  Future<void> loadToken() async {
    final prefs = await SharedPreferences.getInstance();
    _token = prefs.getString('token');
    notifyListeners();
  }

  Future<void> clearToken() async {
    _token = null;
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
    notifyListeners();
  }
}
