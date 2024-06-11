import 'package:flutter_news_app/domain/entity/news_model_entity.dart';

class NewsModel extends NewsModelEntity {
  const NewsModel({
    super.sourceName,
    super.author,
    super.title,
    super.description,
    super.url,
    super.urlToImage,
    super.publishedAt,
    super.content,
  });

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
      sourceName: json['source']['name'] ?? "",
      author: json['author'] ?? "",
      title: json['title'] ?? "",
      description: json['description'] ?? "",
      url: json['url'] ?? "",
      urlToImage: json['urlToImage'] ?? "",
      publishedAt: json['publishedAt'] != null
          ? DateTime.parse(json['publishedAt'])
          : DateTime.now(),
      content: json['content'] ?? "",
    );
  }

  // convertToHiveModel() {
  //   return HiveNewsModel(
  //       sourceName: sourceName,
  //       author: author,
  //       title: title,
  //       description: description,
  //       url: url,
  //       urlToImage: urlToImage,
  //       publishedAt: publishedAt,
  //       content: content);
  // }
}



// {
// -"source": {
// "id": null,
// "name": "Gizmodo.com"
// },
// "author": "Vinamrata Chaturvedi, Quartz",
// "title": "Everything to Know About Bitcoin Pizza Day",
// "description": "On May 22, 2010, a man in Florida paid 10,000 Bitcoin for pizza.Read more...",
// "url": "https://gizmodo.com/bitcoin-pizza-day-date-origin-history-cryptocurrency-1851487831",
// "urlToImage": "https://i.kinja-img.com/image/upload/c_fill,h_675,pg_1,q_80,w_1200/98aec6479bad523f5c89763f4acf0cf9.jpg",
// "publishedAt": "2024-05-20T13:20:00Z",
// "content": "On January 3, 2009, Bitcoins creator, Satoshi Nakamoto, mined the first block of the Bitcoin blockchain, known as the Genesis Block, which contained a reward of 50 Bitcoin. The technical foundations … [+1156 chars]"
// },