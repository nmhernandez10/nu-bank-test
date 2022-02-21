import 'package:flutter_test/flutter_test.dart';
import 'package:nu_bank_test/ui/utils/format.dart';

void main() {
  group('Utils', () {
    test('formatDate is formatting correctly', () async {
      final formattedDate = formatDate(DateTime(2022));

      expect(
        formattedDate,
        'January 1, 2022 12:00:00 AM',
      );
    });
  });
}
