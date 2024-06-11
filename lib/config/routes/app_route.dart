import 'package:flutter/material.dart';
import 'package:flutter_news_app/domain/entity/news_model_entity.dart';
import 'package:flutter_news_app/presentation/pages/news_screen.dart';
import 'package:flutter_news_app/presentation/pages/single_news_screen.dart';

class AppRoutes {
  AppRoutes._();

  static const String initialRoute = "/";
  static const String detailsScreen = "/details";

  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case initialRoute:
        return MaterialPageRoute(builder: (context) => const NewsScreen());

      case detailsScreen:
        return MaterialPageRoute(
            builder: (context) => SingleNewsScreen(
                  newsModel: settings.arguments as NewsModelEntity,
                ));
      default:
        return MaterialPageRoute(builder: (context) => const NewsScreen());
    }
  }
}
