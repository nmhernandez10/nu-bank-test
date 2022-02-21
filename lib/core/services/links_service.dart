import 'package:nu_bank_test/core/models/link.dart';

// Service for links storage (not UI state)
// e.g. databases, shared preferences, etc.
// In this case, we are storing links in memory
class LinksService {
  List<Link> links = [];

  List<Link> getLinks() {
    return List.from(links);
  }

  void addLink(Link newLink) {
    links.add(newLink);
  }

  void deleteAll() {
    links.clear();
  }
}
