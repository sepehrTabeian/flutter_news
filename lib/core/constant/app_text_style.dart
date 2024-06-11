import 'package:flutter/material.dart';
import 'package:flutter_news_app/core/constant/app_sizes.dart';

abstract class AppTextStyle {

  static const TextStyle errorTextStyle =
      TextStyle(fontSize: AppSizes.sizeFont20, color: Colors.grey);

  static const TextStyle captionTextStyle =
      TextStyle(fontSize: AppSizes.sizeFont12);

  static const TextStyle titleMainScreenTextStyle =
      TextStyle(fontSize: AppSizes.sizeFont16, fontWeight: FontWeight.w600);

  static const TextStyle titleSingleScreenTextStyle =
      TextStyle(fontSize: AppSizes.sizeFont20, fontWeight: FontWeight.bold);

  static const TextStyle captionSingleScreenTextStyle = TextStyle(
    fontSize: AppSizes.sizeFont16,
  );
  
  static const TextStyle elevatedTextStyle =  TextStyle(
    fontSize: AppSizes.sizeFont20,
    color: Colors.black,
  ); 
  
   static const TextStyle appBarTextStyle = TextStyle(
      color: Colors.black,
      fontSize: AppSizes.sizeFont16,
    );
}
