import 'package:dio/dio.dart';
import 'package:flutter_news_app/core/constant/app_constant.dart';
import 'package:flutter_news_app/data/api/api_provider.dart';
import 'package:flutter_news_app/data/exeptions/api_exeption.dart';
import 'package:flutter_news_app/injection.dart';

class NewsRequest implements ApiProvider {
  final Map<String, dynamic>? _query;
  final dynamic _body;
  final Map<String, dynamic>? _headers;

  NewsRequest._({
    Map<String, dynamic>? query,
    dynamic body,
    Map<String, dynamic>? headers,
  })  : _query = query,
        _body = body,
        _headers = headers;

  factory NewsRequest.getAll({Map<String, dynamic>? query}) {
    return NewsRequest._(query: query);
  }

  @override
  String get baseUrl => AppConstant.newsAPIBaseURL;

  @override
  String get path => AppConstant.newsAPIEverything;

  @override
  Map<String, dynamic>? get query => _query;

  @override
  dynamic get body => _body;

  @override
  Map<String, dynamic>? get headers => _headers;

  
  @override
  Dio get dio => Dio();

  @override
  Future<Response> request() async {
    final options = Options(
      method: "GET",
      headers: headers,
    );

    try {
      return await dio.get(baseUrl + path,
          queryParameters: query, options: options);
    } on DioException catch (e) {
      throw AppException(e.response?.statusCode, e.response?.data["message"]);
    } catch (ex) {
      throw AppException(0, 'unknown erorr');
    }
  }
  

}
