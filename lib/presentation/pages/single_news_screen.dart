import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news_app/core/constant/app_sizes.dart';
import 'package:flutter_news_app/core/constant/app_text_style.dart';
import 'package:flutter_news_app/core/util/appUtil.dart';
import 'package:flutter_news_app/domain/entity/news_model_entity.dart';

class SingleNewsScreen extends StatefulWidget {
  SingleNewsScreen({super.key, required this.newsModel});
  NewsModelEntity newsModel;

  @override
  State<SingleNewsScreen> createState() => _SingleNewsScreenState();
}

class _SingleNewsScreenState extends State<SingleNewsScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Details"),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: size.height / 40,
            ),
            _customPadding(
              child: Text(
                widget.newsModel.title ?? "",
                style: AppTextStyle.titleSingleScreenTextStyle,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            SizedBox(
              height: size.height / 50,
            ),
            Hero(
              tag: widget.newsModel.urlToImage ?? "",
              child: CachedNetworkImage(
                imageUrl: widget.newsModel.urlToImage ?? "",
                imageBuilder: (context, imageProvider) {
                  return Container(
                    height: size.height / 4,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: imageProvider, fit: BoxFit.cover)),
                  );
                },
                placeholder: (context, url) {
                  return Container(
                    height: size.height / 4,
                    color: Colors.grey.shade300,
                    alignment: Alignment.center,
                    child: const CircularProgressIndicator(),
                  );
                },
                errorWidget: (context, url, error) {
                  return Container(
                    height: size.height / 4,
                    color: Colors.grey.shade300,
                    alignment: Alignment.center,
                    child: const Icon(
                      Icons.photo_size_select_actual_rounded,
                      size: 20,
                    ),
                  );
                },
              ),
            ),
            const SizedBox(
              height: AppSizes.double10,
            ),
            _customPadding(
                child: Row(
              children: [
                Expanded(
                  child: Text(
                    widget.newsModel.author ?? "",
                    maxLines: 1,
                    style: AppTextStyle.captionSingleScreenTextStyle,
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                        AppUtil.dateTimeToFormatString(
                            widget.newsModel.publishedAt!),
                        style: AppTextStyle.captionSingleScreenTextStyle),
                  ),
                ),
              ],
            )),
            const SizedBox(
              height: AppSizes.double10,
            ),
            Expanded(
              flex: 4,
              child: _customPadding(
                child: Text(
                  widget.newsModel.content ?? "",
                  style: const TextStyle(fontSize: 20),
                ),
              ),
            ),
            Expanded(
              child: _customPadding(
                child: ElevatedButton(
                  onPressed: () async {
                    await AppUtil.urlLuncher(widget.newsModel.url ?? "");
                  },
                  child: const Text(
                    "click to see all news",
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: AppSizes.double10,
            )
          ],
        ),
      ),
    );
  }

  Widget _customPadding({required Widget child}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: child,
    );
  }
}
