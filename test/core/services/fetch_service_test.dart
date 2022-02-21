import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mockito/mockito.dart';
import 'package:nu_bank_test/core/services/fetch_service.dart';

class MockClient extends Mock implements Client {
  @override
  Future<Response> post(Uri url,
      {Object? body, Encoding? encoding, Map<String, String>? headers}) {
    return Future.value(Response('{"title":"test"}', 200));
  }
}

void main() {
  const testUrl = 'https://www.google.com';
  group('Fetch Service', () {
    test('fetching post correctly', () async {
      final client = MockClient();

      final fetchService = FetchService(client: client);
      final response = await fetchService.post(url: testUrl);

      expect(
        response['title'],
        'test',
      );
    });
  });
}
