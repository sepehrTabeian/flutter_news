import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'news_model_entity.g.dart';

@HiveType(typeId: 1)
class NewsModelEntity extends Equatable{

  @HiveField(0)
  final String? sourceName;

  @HiveField(1)
  final String? author;

  @HiveField(2)
  final String? title;

  @HiveField(3)
  final String? description;

  @HiveField(4)
  final String? url;

  @HiveField(5)
  final String? urlToImage;

  @HiveField(6)
  final DateTime? publishedAt;

  @HiveField(7)
  final String? content;


  const NewsModelEntity({
    required this.sourceName,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content
  });

  @override
  List<Object?> get props => [
        sourceName,
        author,
        title,
        description,
        url,
        urlToImage,
        publishedAt,
        content
      ];
}
