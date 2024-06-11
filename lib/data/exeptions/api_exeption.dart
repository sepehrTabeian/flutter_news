import 'package:dio/dio.dart';

class AppException implements Exception {
  int? code;
  String? message;
  AppException(
    this.code,
    this.message,
  );
}
