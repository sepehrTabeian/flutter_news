import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_news_app/core/constant/app_constant.dart';
import 'package:flutter_news_app/data/datasource/remote/news_datasource.dart';
import 'package:flutter_news_app/data/repository/news_repository.dart';
import 'package:flutter_news_app/domain/entity/news_model_entity.dart';
import 'package:flutter_news_app/domain/repository/Inews_repository.dart';
import 'package:flutter_news_app/domain/use_case/get_news_use_case.dart';
import 'package:flutter_news_app/domain/use_case/get_save_data_user_case.dart';
import 'package:flutter_news_app/domain/use_case/save_news_use_case.dart';
import 'package:flutter_news_app/presentation/bloc/news_bloc/news_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';

final injection = GetIt.instance;

Future<void> registerDependencies() async {

  //register connection
  injection.registerSingleton<List<ConnectivityResult>>(
      await Connectivity().checkConnectivity());

  // register datasource
  injection.registerSingleton<IRemoteDataSource>(RemoteDataSource());

  //register repository
  injection.registerSingleton<INewsDataRepository>(NewsRepository(injection()));

  //register useCase
  injection.registerSingleton<GetNewsUseCase>(GetNewsUseCase(injection()));
  injection.registerSingleton<GetSaveDataNewsUseCase>(
      GetSaveDataNewsUseCase(injection()));
  injection.registerSingleton<SaveNewsUseCase>(SaveNewsUseCase(injection()));

  //register bloc
  injection.registerFactory<NewsBloc>(
      () => NewsBloc(injection(), injection(), injection()));

  //register hive
  injection.registerSingleton<Box<NewsModelEntity>>(
      Hive.box<NewsModelEntity>(AppConstant.hiveDataBaseName));
}
