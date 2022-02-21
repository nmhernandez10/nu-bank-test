import 'package:nu_bank_test/ui/screens/links_screen.dart';
import 'package:regex_router/regex_router.dart';

final router = RegexRouter.create({
  "/": (context, _) => const LinksScreen(),
});
