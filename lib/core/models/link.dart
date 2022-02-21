class Link {
  String shortenUrl;
  String originalUrl;
  DateTime createdAt;

  Link({
    required this.shortenUrl,
    required this.originalUrl,
    required this.createdAt,
  });

  String get createdAtFormatted => createdAt.toIso8601String();
}
