import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nu_bank_test/core/providers/links_provider.dart';
import 'package:nu_bank_test/locator.dart';
import 'package:nu_bank_test/ui/screens/links_screen.dart';
import 'package:provider/provider.dart';

void main() {
  setUpAll(() {
    WidgetsFlutterBinding.ensureInitialized();

    // Setting singleton services locator
    setUpLocator();
  });
  group('LinksScreen', () {
    testWidgets('link screen is creating correctly',
        (WidgetTester tester) async {
      await tester.pumpWidget(ChangeNotifierProvider<LinksProvider>(
          create: (context) => LinksProvider(),
          child: const MaterialApp(home: LinksScreen())));
      expect(find.text('Iuerel'), findsOneWidget);
    });
  });
}
