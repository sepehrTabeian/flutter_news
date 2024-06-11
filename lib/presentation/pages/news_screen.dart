import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_news_app/core/constant/app_constant.dart';
import 'package:flutter_news_app/core/constant/app_sizes.dart';
import 'package:flutter_news_app/core/constant/app_text_style.dart';
import 'package:flutter_news_app/injection.dart';
import 'package:flutter_news_app/presentation/bloc/news_bloc/news_bloc.dart';
import 'package:flutter_news_app/presentation/bloc/news_bloc/news_event.dart';
import 'package:flutter_news_app/presentation/bloc/news_bloc/news_state.dart';
import 'package:flutter_news_app/presentation/widgets/news_widget.dart';
import 'package:flutter_news_app/presentation/widgets/pop_up_menu.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Daily News"),
        actions: [
          IconButton(
            onPressed: () {
              showPopupMenu(context);
            },
            icon: const Icon(
              Icons.menu,
              size: AppSizes.double20,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: _buildBody(),
      ),
    );
  }

  _buildBody() {
    return BlocBuilder<NewsBloc, NewsState>(

      builder: (context, state) {
        if (state is NewsLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (state is NewsError) {
          return Center(
            child: Text(
              state.error!.message ?? "Something went wrong",
              style: AppTextStyle.errorTextStyle,
            ),
          );
        }

        if (state is NewsLoaded) {
          return ListView.builder(
            itemBuilder: (context, index) {
              return NewsWidget(
                index: index,
                newsModelEntity: state.news![index],
              );
            },
            itemCount: state.news!.length,
          );
        }

        return Container();
      },
    );
  }
}
