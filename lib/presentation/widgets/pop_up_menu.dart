import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_news_app/core/constant/app_constant.dart';
import 'package:flutter_news_app/core/constant/app_sizes.dart';
import 'package:flutter_news_app/injection.dart';
import 'package:flutter_news_app/presentation/bloc/news_bloc/news_bloc.dart';
import 'package:flutter_news_app/presentation/bloc/news_bloc/news_event.dart';

void showPopupMenu(BuildContext context) async {
  final RenderBox overlay =
      Overlay.of(context).context.findRenderObject() as RenderBox;

  final result = await showMenu<String>(
    context: context,
    position: RelativeRect.fromLTRB(overlay.size.width, 0, 0, 0),
    items: AppConstant.queryList.map((String item) {
      return PopupMenuItem<String>(
        value: item,
        child: Text(item.toUpperCase()),
      );
    }).toList(),
    elevation: AppSizes.elevation,
  );

  // Handle the selected menu item
  if (result != null) {
    AppConstant.defaultQuery = result;
    // ignore: use_build_context_synchronously
    BlocProvider.of<NewsBloc>(context)
        .add(GetNewsFromTag(tag: AppConstant.defaultQuery));
  }
}
