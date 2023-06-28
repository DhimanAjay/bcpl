
import 'package:shared_preferences/shared_preferences.dart';

class PreferenceManager{
  
  static Future<String> getString(String key, {String defaultValue = ""}) {
    var preference = SharedPreferences.getInstance();
    return preference.then((preference) => preference.getString(key) ?? defaultValue);
  }

  
  static Future<bool> setString(String key, String value) {
    var preference = SharedPreferences.getInstance();
    return preference.then((preference) => preference.setString(key, value));
  }

  
  static Future<int> getInt(String key, {int defaultValue = 0}) {
    var preference = SharedPreferences.getInstance();
    return preference.then((preference) => preference.getInt(key) ?? defaultValue);
  }

  
  static Future<bool> setInt(String key, int value) {
    var preference = SharedPreferences.getInstance();
    return preference.then((preference) => preference.setInt(key, value));
  }

  
  static Future<double> getDouble(String key, {double defaultValue = 0.0}) {
    var  preference = SharedPreferences.getInstance();
    return preference.then((preference) => preference.getDouble(key) ?? defaultValue);
  }

  
  static Future<bool> setDouble(String key, double value) {
    var preference = SharedPreferences.getInstance();
    return preference.then((preference) => preference.setDouble(key, value));
  }

  
  static Future<bool> getBool(String key, {bool defaultValue = false}) {
    var preference = SharedPreferences.getInstance();
    return preference.then((preference) => preference.getBool(key) ?? defaultValue);
  }

  
  static Future<bool> setBool(String key, bool value) {
    var preference = SharedPreferences.getInstance();
    return preference.then((preference) => preference.setBool(key, value));
  }

  
  static Future<List<String>> getStringList(String key, {List<String> defaultValue = const []}) {
    var  preference = SharedPreferences.getInstance();
    return preference.then((preference) => preference.getStringList(key) ?? defaultValue);
  }

  
  static Future<bool> setStringList(String key, List<String> value) {
    var preference = SharedPreferences.getInstance();
    return preference.then((preference) => preference.setStringList(key, value));
  }

  
  static Future<bool> remove(String key) {
    var preference = SharedPreferences.getInstance();
    return preference.then((preference) => preference.remove(key));
  }

  
  static Future<bool> clear() {
    var preference = SharedPreferences.getInstance();
    return preference.then((preference) => preference.clear());
  }
}
