import 'package:shared_preferences/shared_preferences.dart';

class StorageServices {
  static write(String key, String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  static read(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? readValue = prefs.getString(key);
    return readValue;
  }

  static clear(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }

  static clearAll() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }
}
