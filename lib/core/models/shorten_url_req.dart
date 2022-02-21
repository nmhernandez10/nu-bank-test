// DTO class to request shorten url service
class ShortenUrlReq {
  String url;

  ShortenUrlReq({required this.url});

  Map<String, dynamic> toJson() => {'url': url};
}
