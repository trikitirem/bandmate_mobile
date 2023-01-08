import 'dart:convert';
import 'package:http/http.dart' as http;
import '../errors/errors.dart';
import '../errors/exceptions.dart';
import '../utils/local_storage.dart';

class HttpService {
  Uri _url(String path) => Uri.parse('http://127.0.0.1:5500$path');

  Future<Map<String, String>> _headers() async {
    final token = await readToken();

    return {
      'Content-Type': 'application/json',
      'authorization': 'Bearer $token'
    };
  }

  Map<String, dynamic> _respond(http.Response response) {
    var json = jsonDecode(response.body);

    if (response.statusCode >= 200 && response.statusCode < 300) {
      return json;
    }

    throw ApiException(json["error"] ?? CommonErrors.unknownError);
  }

  Future<Map<String, dynamic>> getData(String path) async {
    var response = await http.get(_url(path), headers: await _headers());
    return _respond(response);
  }

  Future<Map<String, dynamic>> post(
      String path, Map<String, dynamic> body) async {
    var response = await http.post(
      _url(path),
      body: jsonEncode(body),
      headers: await _headers(),
    );
    return _respond(response);
  }

  Future<Map<String, dynamic>> put(
      String path, Map<String, dynamic> body) async {
    var response = await http.put(
      _url(path),
      body: jsonEncode(body),
      headers: await _headers(),
    );
    return _respond(response);
  }
}
