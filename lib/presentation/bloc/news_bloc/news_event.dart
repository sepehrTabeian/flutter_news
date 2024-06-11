import 'package:flutter/cupertino.dart';
import 'package:flutter_news_app/presentation/bloc/news_bloc/news_state.dart';

abstract class NewsEvent{}


class GetNewsEvent extends NewsEvent{
}

class GetNewsFromTag extends NewsEvent{
  String tag;
  GetNewsFromTag({required this.tag});
}

