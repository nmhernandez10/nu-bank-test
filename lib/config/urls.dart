import 'package:flutter_config/flutter_config.dart';

// Urls defined for fetch services
abstract class Url {
  static String shortenerUrl = FlutterConfig.get('SHORTENER_URL');
}

// Paths defined for fetch services
abstract class Path {
  static String shortenerAliasPath = '/api/alias';
}
