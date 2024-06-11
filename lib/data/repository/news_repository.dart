import 'package:flutter_news_app/core/resources/data_state.dart';
import 'package:flutter_news_app/core/util/appUtil.dart';
import 'package:flutter_news_app/data/datasource/remote/news_datasource.dart';
import 'package:flutter_news_app/data/exeptions/api_exeption.dart';
import 'package:flutter_news_app/data/model/news_model.dart';
import 'package:flutter_news_app/data/repository/storeToHive.dart';
import 'package:flutter_news_app/domain/entity/news_model_entity.dart';
import 'package:flutter_news_app/domain/repository/Inews_repository.dart';
import 'package:flutter_news_app/injection.dart';
import 'package:hive/hive.dart';

class NewsRepository extends INewsDataRepository {
  final IRemoteDataSource _newsDataSource;
  NewsRepository(this._newsDataSource);

  @override
  Future<DataState<List<NewsModelEntity>>> getNews(
      String tagName ) async {
    try {
      final response = await _newsDataSource.getNews(tagName);


      return DataSuccess(response.data["articles"]
          .map<NewsModelEntity>((e) => NewsModel.fromJson(e))
          .toList());
    } on AppException catch (e) {
      return DataFailed(e);
    }
  }

  @override
  Future<List<NewsModelEntity>> getSaveData() async {
    final box = injection.get<Box<NewsModelEntity>>();
    return box.values.toList();
  }

  @override
  Future<void> saveNewToDb(List<NewsModelEntity> newsModel) {
    storeData(newsModel);
    return Future.value();
  }
}
