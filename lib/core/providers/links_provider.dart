import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:nu_bank_test/core/models/link.dart';
import 'package:nu_bank_test/core/services/links_service.dart';

class LinksProvider extends ChangeNotifier {
  // Singleton instance to use links services
  final LinksService _linksService = GetIt.I<LinksService>();

  // Internal private state of links list.
  List<Link> _links = [];

  // Whether provider initial state is loaded.
  bool _loaded = false;

  // The current loaded value.
  bool get loaded => _loaded;

  // An unmodifiable view of the links list.
  UnmodifiableListView<Link> get links => UnmodifiableListView(_links);

  // Return current link at a given index.
  Link getLink(int index) => links[index];

  LinksProvider() {
    _load();
  }

  // Load initial state of _loaded and _links values.
  void _load() {
    List<Link> loadedLinks = _linksService.getLinks();
    _links = loadedLinks;
    _loaded = true;
    notifyListeners();
  }

  // Add link
  void addLink(Link link) {
    // Add link using service.
    _linksService.addLink(link);
    // Update state.
    _links.add(link);
    notifyListeners();
  }
}
