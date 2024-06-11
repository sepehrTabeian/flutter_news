import 'package:flutter_news_app/data/exeptions/api_exeption.dart';

abstract class DataState<T> {
  final T? data;
  final AppException? error;

  const DataState({this.data, this.error});
}

class DataSuccess<T> extends DataState<T> {
  const DataSuccess(T data) : super(data: data);
}

class DataFailed<T> extends DataState<T> {
  const DataFailed(AppException error) : super(error: error);
}
