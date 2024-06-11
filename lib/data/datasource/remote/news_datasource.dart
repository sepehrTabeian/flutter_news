import 'package:dio/dio.dart';
import 'package:flutter_news_app/core/constant/app_constant.dart';
import 'package:flutter_news_app/data/api/news_requests.dart';
import 'package:flutter_news_app/data/exeptions/api_exeption.dart';
import 'package:flutter_news_app/data/model/news_model.dart';
import 'package:flutter_news_app/injection.dart';

abstract class IRemoteDataSource {
  Future<Response> getNews(String tagName);
}

class RemoteDataSource implements IRemoteDataSource {
  @override
  Future<Response> getNews(String tagName) async {
    // Get current date and time
    DateTime now = DateTime.now();

    // Subtract one day from the current date and time
    DateTime yesterday = now.subtract(const Duration(days: 1));

    final _api = NewsRequest.getAll(query: {
      "q": tagName,
      // "from": yesterday.toIso8601String(),
      // "to": now.toIso8601String(),
      "language": AppConstant.countryQuery,
      "sortBy": AppConstant.sortedQuery,
      "apiKey": AppConstant.newsAPIKey,
    });

    final response = await _api.request();

    if (response.statusCode == 200) {
      return response;
    } else {
      throw AppException(0, 'unknown erorr');
    }
  }
}
