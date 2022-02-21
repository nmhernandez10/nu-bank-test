import 'package:nu_bank_test/core/models/link.dart';

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
