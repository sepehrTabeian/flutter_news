import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news_app/config/routes/app_route.dart';
import 'package:flutter_news_app/injection.dart';
import 'package:url_launcher/url_launcher.dart';

class AppUtil {
  AppUtil._();

  static void navigateToSinglePage(context, hiveNewsModel) {
    Navigator.pushNamed(
      context,
      AppRoutes.detailsScreen,
      arguments: hiveNewsModel,
    );
  }

  static bool checkConnection() {
    final connectivityResult = injection.get<List<ConnectivityResult>>();
    if (connectivityResult.contains(ConnectivityResult.mobile)) {
      return true;
    } else if (connectivityResult.contains(ConnectivityResult.wifi)) {
      return true;
    }

    return false;
  }

  static Future<void> urlLuncher(String url) async {
    if (!await launchUrl(Uri.parse(url),
        mode: LaunchMode.externalApplication)) {
      Exception("Could not launch $url");
    }
  }

  static String dateTimeToFormatString(DateTime time) {
    return "${time.day}/${time.month}/${time.year}  ${time.hour}:${time.minute}";
  }
}
