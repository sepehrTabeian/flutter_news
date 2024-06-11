import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_news_app/config/routes/app_route.dart';
import 'package:flutter_news_app/core/constant/app_sizes.dart';
import 'package:flutter_news_app/core/constant/app_text_style.dart';
import 'package:flutter_news_app/core/util/appUtil.dart';
import 'package:flutter_news_app/domain/entity/news_model_entity.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class NewsWidget extends StatelessWidget {
  NewsWidget({super.key, required this.index, required this.newsModelEntity});
  int index;
  NewsModelEntity newsModelEntity;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return GestureDetector(
      onTap: () {
        AppUtil.navigateToSinglePage(context, newsModelEntity);
      },
      child: Container(
        width: size.width,
        height: size.height / 3.3,
        margin: EdgeInsets.symmetric(
            horizontal: size.width / 40, vertical: size.height / 120),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(AppSizes.borderRadiusSize15),
          border:
              Border.all(color: Colors.grey, width: AppSizes.borderSize5),
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              blurRadius: AppSizes.blureSizeShadow10,
              spreadRadius: -2,
              offset: Offset(0, 10),
            )
          ],
        ),
        padding: const EdgeInsets.all(AppSizes.double10),
        child: _child(size, newsModelEntity),
      ),
    );
  }

  VoidCallback _navigateToSinglePage(context) {
    return () {
      Navigator.pushNamed(
        context,
        AppRoutes.detailsScreen,
        arguments: newsModelEntity,
      );
    };
  }

  Widget _child(Size size, NewsModelEntity newsModel) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Hero(
          tag: newsModel.urlToImage ?? "",
          child: CachedNetworkImage(
            cacheManager: CacheManager(
              Config(
                newsModel.urlToImage ?? "",
                stalePeriod: const Duration(days: 7),
                maxNrOfCacheObjects: 100,
              ),
            ),
            fadeOutDuration: Duration.zero,
            fadeInDuration: Duration.zero,
            imageUrl: newsModel.urlToImage ?? "",
            imageBuilder: (context, imageProvider) {
              return Container(
                width: double.infinity,
                height: size.height / 6.5,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(AppSizes.double10),
                    image: DecorationImage(
                        image: imageProvider, fit: BoxFit.cover)),
              );
            },
            placeholder: (context, url) {
              return Container(
                width: double.infinity,
                height: size.height / 6.5,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius:
                      BorderRadius.circular(AppSizes.borderRadiusSize10),
                ),
                child: const CircularProgressIndicator(),
              );
            },
            errorWidget: (context, url, error) {
              return Container(
                  width: double.infinity,
                  height: size.height / 6.5,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius:
                        BorderRadius.circular(AppSizes.borderRadiusSize10),
                  ),
                  child: const Icon(
                    Icons.photo_size_select_actual_rounded,
                    size: AppSizes.double20,
                  ));
            },
          ),
        ),
        const SizedBox(
          height: AppSizes.double5,
        ),
        Row(
          children: [
            Expanded(
              child: Text(newsModel.author ?? "",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyle.captionTextStyle),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                    AppUtil.dateTimeToFormatString(newsModel.publishedAt!),
                    style: AppTextStyle.captionTextStyle),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: AppSizes.double2,
        ),
        Text(
          newsModel.title ?? "",
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontSize: 16,
          ),
        ),
        const SizedBox(
          height: AppSizes.double2,
        ),
        Expanded(
          child: Text(
            newsModel.description ?? "",
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyle.titleMainScreenTextStyle,
          ),
        ),
      ],
    );
  }
}
