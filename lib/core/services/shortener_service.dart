import 'package:nu_bank_test/config/urls.dart';
import 'package:nu_bank_test/core/models/link.dart';
import 'package:nu_bank_test/core/models/shorten_url_res.dart';
import 'package:nu_bank_test/core/services/fetch_service.dart';

import '../models/shorten_url_req.dart';

class ShortenerService {
  Future<Link> shortenLink({required String url}) async {
    ShortenUrlReq shortenUrlReq = ShortenUrlReq(url: url);
    print('req body');
    print(shortenUrlReq.toJson());
    var response = await FetchService.post(
      url: Url.shortenerUrl,
      path: Path.shortenerAliasPath,
      body: shortenUrlReq.toJson(),
    );
    print('response shorten');
    print(response);
    ShortenUrlRes shortenUrlRes = ShortenUrlRes.fromJson(response);
    return Link(
      createdAt: DateTime.now(),
      originalUrl: shortenUrlRes.originalUrl,
      shortenUrl: shortenUrlRes.shortUrl,
    );
  }
}