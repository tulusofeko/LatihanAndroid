import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

class SharePreferencess {
  static final String userLogin = 'user_login';

  //Hapus cache base on Key
  static Future<bool> clearPreferences(String key) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.getString(key);
    return preferences.remove(key);
  }

  //Hapus semua cache
  static Future<bool> clearAllPreference() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.clear();
  }

  //Fungsi simpan cache
  static Future<bool> setPreferences(String value, String key) async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.setString(key, value);
  }

  // fungsi ngambil cache
  static Future<String> getPreferences(String key) async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(key);
  }

  // check keberadaan key
  static Future<bool> checKey(String key) async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.containsKey(key);
  }
}

