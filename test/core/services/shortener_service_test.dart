import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:mockito/mockito.dart';
import 'package:nu_bank_test/core/models/link.dart';
import 'package:nu_bank_test/core/services/fetch_service.dart';
import 'package:nu_bank_test/core/services/shortener_service.dart';

class MockClient extends Mock implements Client {
  @override
  Future<Response> post(Uri url,
      {Object? body, Encoding? encoding, Map<String, String>? headers}) {
    return Future.value(Response(
        '{"alias":"<url alias>","_links": {"self":"<original url>","short":"<short url>"}}',
        200));
  }
}

void main() {
  const testUrl = 'https://www.google.com';
  setUpAll(() async {
    WidgetsFlutterBinding.ensureInitialized();

    // Setting ENV variables from .env file
    await FlutterConfig.loadValueForTesting({'SHORTENER_URL': testUrl});

    // Shortener service tests need services locator
    GetIt.I.registerLazySingleton<FetchService>(
        () => FetchService(client: MockClient()));
  });
  group('Fetch Service', () {
    test('fetching post correctly', () async {
      final shortenerService = ShortenerService();
      Link link = await shortenerService.shortenLink(url: testUrl);

      expect(
        link.originalUrl,
        '<original url>',
      );
    });
  });
}
