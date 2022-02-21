import 'package:get_it/get_it.dart';
import 'package:nu_bank_test/config/urls.dart';
import 'package:nu_bank_test/core/models/link.dart';
import 'package:nu_bank_test/core/models/shorten_url_res.dart';
import 'package:nu_bank_test/core/services/fetch_service.dart';

import '../models/shorten_url_req.dart';

// Service to request shorten link endpoint
class ShortenerService {
  Future<Link> shortenLink({required String url}) async {
    ShortenUrlReq shortenUrlReq = ShortenUrlReq(url: url);
    var response = await GetIt.I.get<FetchService>().post(
          url: Url.shortenerUrl,
          path: Path.shortenerAliasPath,
          body: shortenUrlReq.toJson(),
        );
    ShortenUrlRes shortenUrlRes = ShortenUrlRes.fromJson(response);
    return Link(
      createdAt: DateTime.now(),
      originalUrl: shortenUrlRes.originalUrl,
      shortenUrl: shortenUrlRes.shortUrl,
    );
  }
}
