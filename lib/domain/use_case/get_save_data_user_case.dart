import 'package:flutter_news_app/core/usecase/usecase.dart';
import 'package:flutter_news_app/domain/entity/news_model_entity.dart';
import 'package:flutter_news_app/domain/repository/Inews_repository.dart';

class GetSaveDataNewsUseCase implements UseCase<List<NewsModelEntity>, void> {
  final INewsDataRepository _newsRepository;

  GetSaveDataNewsUseCase(this._newsRepository);
  @override
  Future<List<NewsModelEntity>> call({void params}) {
    return _newsRepository.getSaveData();
  }
}
