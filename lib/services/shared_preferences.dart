import 'package:shared_preferences/shared_preferences.dart';

class InternalStorage {
  static setValue(String key, dynamic value) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    value is int
        ? preferences.setInt(key, value)
        : value is bool
            ? preferences.setBool(key, value)
            : value is double
                ? preferences.setDouble(key, value)
                : value is String
                    ? preferences.setString(key, value)
                    : preferences.setStringList(key, value);
  }

  static getValue(String key) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    return preferences.get(key);
  }
}
