import 'dart:convert';

import 'package:http/http.dart' as http;

// Global service for http requests
class FetchService {
  static Map<String, String> defaultHeaders = {
    'Content-Type': 'application/json'
  };

  static Future<dynamic> get(
      {required String url, String? path, Map<String, String>? headers}) async {
    Uri uri = Uri.parse('$url$path');
    http.Response response = await http.get(uri, headers: headers);
    return jsonDecode(response.body);
  }

  static Future<dynamic> post(
      {required String url,
      String? path,
      Map<String, String>? headers,
      Map<String, dynamic>? body}) async {
    Uri uri = Uri.parse('$url$path');
    http.Response response = await http.post(uri,
        headers: headers ?? defaultHeaders, body: jsonEncode(body ?? {}));
    return jsonDecode(response.body);
  }
}
