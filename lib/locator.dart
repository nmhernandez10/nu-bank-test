import 'package:get_it/get_it.dart';
import 'package:nu_bank_test/core/services/fetch_service.dart';
import 'package:nu_bank_test/core/services/links_service.dart';
import 'package:nu_bank_test/core/services/shortener_service.dart';

void setUpLocator() {
  GetIt.I.registerLazySingleton<LinksService>(() => LinksService());
  GetIt.I.registerLazySingleton<ShortenerService>(() => ShortenerService());
  GetIt.I.registerLazySingleton<FetchService>(() => FetchService());
}
