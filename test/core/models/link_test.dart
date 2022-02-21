import 'package:flutter_test/flutter_test.dart';
import 'package:nu_bank_test/core/models/link.dart';

void main() {
  group('Link', () {
    test('createdAt is formatted correctly', () {
      DateTime date = DateTime.now();
      expect(
        Link(
          shortenUrl: '',
          originalUrl: '',
          createdAt: date,
        ).createdAtFormatted,
        date.toIso8601String(),
      );
    });
  });
}
