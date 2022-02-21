import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:nu_bank_test/core/providers/links_provider.dart';
import 'package:nu_bank_test/locator.dart';
import 'package:nu_bank_test/ui/screens/links_screen.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setUpLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<LinksProvider>(
          create: (_) => LinksProvider(),
          lazy: false,
        ),
      ],
      child: MaterialApp(
        title: 'Iuerel',
        localizationsDelegates: const [
          FormBuilderLocalizations.delegate,
        ],
        theme: ThemeData(
          primarySwatch: Colors.amber,
        ),
        home: const LinksScreen(),
      ),
    );
  }
}
