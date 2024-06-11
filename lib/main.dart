import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_news_app/config/routes/app_route.dart';
import 'package:flutter_news_app/config/theme/light_theme.dart';
import 'package:flutter_news_app/core/constant/app_constant.dart';
import 'package:flutter_news_app/domain/entity/news_model_entity.dart';
import 'package:flutter_news_app/injection.dart';
import 'package:flutter_news_app/presentation/bloc/news_bloc/news_bloc.dart';
import 'package:flutter_news_app/presentation/bloc/news_bloc/news_event.dart';
import 'package:flutter_news_app/presentation/pages/news_screen.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDocDir = await getApplicationDocumentsDirectory();

  Hive.init(appDocDir.path);
  Hive.registerAdapter(NewsModelEntityAdapter());
  await Hive.openBox<NewsModelEntity>(AppConstant.hiveDataBaseName);
  await registerDependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: AppRoutes.generateRoute,
      theme: lightTheme(),
      home: BlocProvider(
        create: (context) {
          final bloc = injection.get<NewsBloc>();

          bloc.add(GetNewsEvent());

          return bloc;
        },
        child: const NewsScreen(),
      ),
    );
  }
}
