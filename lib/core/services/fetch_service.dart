import 'dart:convert';

import 'package:http/http.dart' as http;

// Global service for http requests
class FetchService {
  final http.Client client;

  FetchService({http.Client? client}) : client = client ?? http.Client();

  static final Map<String, String> defaultHeaders = {
    'Content-Type': 'application/json'
  };

  Future<dynamic> post(
      {required String url,
      String? path,
      Map<String, String>? headers,
      Map<String, dynamic>? body}) async {
    Uri uri = Uri.parse('$url$path');
    http.Response response = await client.post(uri,
        headers: headers ?? defaultHeaders, body: jsonEncode(body ?? {}));
    return jsonDecode(response.body);
  }
}
