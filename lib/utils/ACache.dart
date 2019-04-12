import 'dart:convert';

import 'package:flutter_app/model/User.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ACache {
  static Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  static Future<bool> saveString(String key, String value) async {
    SharedPreferences prefs = await _prefs;
    return prefs.setString(key, value);
  }

  static Future<String> getString(String key) async {
    SharedPreferences prefs = await _prefs;
    return prefs.getString(key);
  }

  static Future<bool> saveInt(String key, int value) async {
    SharedPreferences prefs = await _prefs;
    return prefs.setInt(key, value);
  }

  static Future<int> getInt(String key) async {
    SharedPreferences prefs = await _prefs;
    return prefs.getInt(key);
  }

  static Future<User> getUser() async {
    User user;
    getString('user').then((userJson) {
      if (userJson != null) user = User.fromJSON(jsonDecode(userJson));
    });
    return user;
  }

  static Future<bool> loginOut() async {
    SharedPreferences prefs = await _prefs;
    return prefs.setString('user', null);
  }
}
