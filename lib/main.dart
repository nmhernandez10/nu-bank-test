import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:nu_bank_test/config/router.dart';
import 'package:nu_bank_test/core/providers/links_provider.dart';
import 'package:nu_bank_test/locator.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Setting localization
  await EasyLocalization.ensureInitialized();

  // Setting ENV variables from .env file
  await FlutterConfig.loadEnvVariables();

  // The next code line allows Android usage correctly with no any extras changes
  // ignore: invalid_use_of_visible_for_testing_member
  FlutterConfig.loadValueForTesting(
      {'SHORTENER_URL': 'https://url-shortener-nu.herokuapp.com'});

  // Setting singleton services locator
  setUpLocator();

  // Setting app
  runApp(EasyLocalization(
    supportedLocales: const [Locale('en')],
    path: 'assets/translations',
    fallbackLocale: const Locale('en'),
    child: const MyApp(),
  ));
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
        localizationsDelegates: [
          FormBuilderLocalizations.delegate,
          ...context.localizationDelegates,
        ],
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        theme: ThemeData(
          primarySwatch: Colors.amber,
        ),
        onGenerateRoute: router.generateRoute,
      ),
    );
  }
}
