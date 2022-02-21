// DTO class to parse response from shorten url service
class ShortenUrlRes {
  String alias;
  String originalUrl;
  String shortUrl;

  ShortenUrlRes(
      {required this.alias, required this.originalUrl, required this.shortUrl});

  factory ShortenUrlRes.fromJson(Map<String, dynamic> json) {
    return ShortenUrlRes(
        alias: json['alias'],
        originalUrl: json['_links']?['self'],
        shortUrl: json['_links']?['short']);
  }
}
