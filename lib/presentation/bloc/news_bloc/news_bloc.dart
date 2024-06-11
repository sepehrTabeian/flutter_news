import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_news_app/core/constant/app_constant.dart';
import 'package:flutter_news_app/core/resources/data_state.dart';
import 'package:flutter_news_app/core/util/appUtil.dart';
import 'package:flutter_news_app/data/exeptions/api_exeption.dart';
import 'package:flutter_news_app/domain/use_case/get_news_use_case.dart';
import 'package:flutter_news_app/domain/use_case/get_save_data_user_case.dart';
import 'package:flutter_news_app/domain/use_case/save_news_use_case.dart';
import 'package:flutter_news_app/presentation/bloc/news_bloc/news_event.dart';
import 'package:flutter_news_app/presentation/bloc/news_bloc/news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  GetNewsUseCase getNewsUseCase;
  GetSaveDataNewsUseCase getSaveDataNewsUseCase;
  SaveNewsUseCase saveNewsUseCase;

  NewsBloc(
      this.getNewsUseCase, this.getSaveDataNewsUseCase, this.saveNewsUseCase)
      : super(NewsInitial()) {
    on<GetNewsEvent>(
      (event, emit) async {
        //fetch data from db
        final data = await getSaveDataNewsUseCase();

        //check connection
        if (!AppUtil.checkConnection()) {
          if (data.isNotEmpty) {
            emit(NewsLoaded(
              news: data,
            ));
          } else {
            emit(NewsError(
              error:
                  AppException(0, "Please Connect To Internet and Try Again"),
            ));
          }
        } else {
          //show loading if data is empty else show data from DB
          if (data.isEmpty) {
            emit(NewsLoading());
          } else {
            emit(NewsLoaded(news: data));
          }

          final statusNews = await getNewsUseCase();

          if (statusNews is DataSuccess) {
            saveNewsUseCase.call(params: statusNews.data ?? []);
            emit(NewsLoaded(
              news: statusNews.data ?? [],
            ));
          }
          if (statusNews is DataFailed) {
            emit(NewsError(error: statusNews.error!));
          }
        }
      },
    );

    on<GetNewsFromTag>(
      (event, emit) async {
        emit(NewsLoading());
        final statusNews = await getNewsUseCase.call(params: event.tag);

        if (statusNews is DataSuccess) {
          saveNewsUseCase.call(params: statusNews.data ?? []);
          emit(NewsLoaded(
            news: statusNews.data ?? [],
          ));
        }
        if (statusNews is DataFailed) {
          emit(NewsError(error: statusNews.error!));
        }
      },
    );
  }
}
