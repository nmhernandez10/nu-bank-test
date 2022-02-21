import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nu_bank_test/core/models/link.dart';
import 'package:nu_bank_test/ui/widgets/link_list_tile.dart';

void main() {
  group('LinkListTile widget', () {
    testWidgets('link list tile is creating correctly',
        (WidgetTester tester) async {
      Link link = Link(
        shortenUrl: '',
        originalUrl: '',
        createdAt: DateTime.now(),
      );
      await tester.pumpWidget(
          MaterialApp(home: Scaffold(body: LinkListTile(link: link))));
      expect(find.text(''), findsNWidgets(2));
    });
  });
}
