import 'package:flutter_news_app/core/usecase/usecase.dart';
import 'package:flutter_news_app/domain/entity/news_model_entity.dart';
import 'package:flutter_news_app/domain/repository/Inews_repository.dart';

class SaveNewsUseCase implements UseCase<void, List<NewsModelEntity>> {
  final INewsDataRepository _newsRepository;

  SaveNewsUseCase(this._newsRepository);
  @override
  Future<void> call({List<NewsModelEntity> params = const []}) {
    return _newsRepository.saveNewToDb(params);
  }
}
