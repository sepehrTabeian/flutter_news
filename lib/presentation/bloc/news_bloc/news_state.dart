import 'package:flutter_news_app/data/exeptions/api_exeption.dart';
import 'package:flutter_news_app/domain/entity/news_model_entity.dart';

abstract class NewsState {
  final List<NewsModelEntity>? news;
  final AppException? error;

  NewsState({this.news, this.error});
}

class NewsInitial extends NewsState {}

class NewsLoading extends NewsState {}

class NewsLoaded extends NewsState {
  NewsLoaded({required List<NewsModelEntity> news}) : super(news: news);
}

class NewsError extends NewsState {
   NewsError({required AppException error}) : super(error: error);

}
