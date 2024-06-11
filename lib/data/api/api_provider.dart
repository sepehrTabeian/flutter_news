import 'package:dio/dio.dart';

abstract class ApiProvider {
  Dio get dio;
  String get baseUrl;
  String get path;
  Future<Response> request();
  Map<String, dynamic>? get query;
  dynamic get body;
  Map<String, dynamic>? get headers;
}
