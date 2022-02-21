import 'package:flutter_test/flutter_test.dart';
import 'package:nu_bank_test/core/models/link.dart';
import 'package:nu_bank_test/core/providers/links_provider.dart';
import 'package:nu_bank_test/locator.dart';

void main() {
  setUpAll(() {
    // Links provider tests need services locator
    setUpLocator();
  });
  group('Links Provider', () {
    test('provider is loading correctly', () {
      LinksProvider provider = LinksProvider();
      expect(
        provider.loaded,
        true,
      );
    });

    test('provider is adding a link correctly', () {
      LinksProvider provider = LinksProvider();
      provider.addLink(Link(
        createdAt: DateTime.now(),
        originalUrl: '',
        shortenUrl: '',
      ));
      expect(
        provider.links.length,
        1,
      );
    });
  });
}
