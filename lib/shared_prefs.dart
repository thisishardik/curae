import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserInfoFromSharedPrefs {
  Future<SharedPreferences> saveInfo() async {
    Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
//    final SharedPreferences prefs = await _prefs;
    return _prefs;
  }

  Future<SharedPreferences> getInfo() async {
    Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;
    return _prefs;
  }
}
