// ignore: import_of_legacy_library_into_null_safe
import 'package:shared_preferences/shared_preferences.dart';

const _kTokenKey = "token";

Future saveToken(String token) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString(_kTokenKey, token);
}

Future<String> readToken() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString(_kTokenKey) ?? "";
}
