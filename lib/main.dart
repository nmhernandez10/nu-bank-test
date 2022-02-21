import 'package:flutter/material.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:nu_bank_test/config/router.dart';
import 'package:nu_bank_test/core/providers/links_provider.dart';
import 'package:nu_bank_test/locator.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Setting ENV variables from .env file
  await FlutterConfig.loadEnvVariables();

  // Setting singleton services locator
  setUpLocator();

  // Setting app
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Initializing state management providers
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<LinksProvider>(
          create: (_) => LinksProvider(),
          lazy: false,
        ),
      ],
      // Creating application widget
      child: MaterialApp(
        title: 'Iuerel',
        localizationsDelegates: const [
          FormBuilderLocalizations.delegate,
        ],
        theme: ThemeData(
          primarySwatch: Colors.amber,
        ),
        onGenerateRoute: router.generateRoute,
      ),
    );
  }
}
