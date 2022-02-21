import 'package:flutter_test/flutter_test.dart';
import 'package:nu_bank_test/core/models/link.dart';
import 'package:nu_bank_test/core/services/links_service.dart';

void main() {
  group('Links Service', () {
    test('link service is getting correctly', () {
      LinksService service = LinksService();
      expect(
        service.links.isEmpty,
        true,
      );
    });

    test('link service is adding correctly a link', () {
      LinksService service = LinksService();
      service.addLink(Link(
        createdAt: DateTime.now(),
        originalUrl: '',
        shortenUrl: '',
      ));
      expect(
        service.links.length,
        1,
      );
    });
  });
}
