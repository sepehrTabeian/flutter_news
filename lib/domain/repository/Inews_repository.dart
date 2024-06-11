import 'package:flutter_news_app/core/resources/data_state.dart';
import 'package:flutter_news_app/domain/entity/news_model_entity.dart';

abstract class INewsDataRepository {
  Future<DataState<List<NewsModelEntity>>> getNews(String tagName);
  Future<List<NewsModelEntity>> getSaveData();
  Future<void> saveNewToDb(List<NewsModelEntity> newsModel);
}
