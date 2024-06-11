import 'package:flutter_news_app/core/constant/app_constant.dart';
import 'package:flutter_news_app/core/resources/data_state.dart';
import 'package:flutter_news_app/core/usecase/usecase.dart';
import 'package:flutter_news_app/data/repository/news_repository.dart';
import 'package:flutter_news_app/domain/entity/news_model_entity.dart';
import 'package:flutter_news_app/domain/repository/Inews_repository.dart';

class GetNewsUseCase
  implements UseCase<DataState<List<NewsModelEntity>>, String> {
  final INewsDataRepository _newsRepository;

  GetNewsUseCase(this._newsRepository);

  @override
  Future<DataState<List<NewsModelEntity>>> call(
      {String params = AppConstant.google}) {
    return _newsRepository.getNews(params);
  }
}
