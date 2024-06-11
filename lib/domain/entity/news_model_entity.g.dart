// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_model_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NewsModelEntityAdapter extends TypeAdapter<NewsModelEntity> {
  @override
  final int typeId = 1;

  @override
  NewsModelEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return NewsModelEntity(
      sourceName: fields[0] as String?,
      author: fields[1] as String?,
      title: fields[2] as String?,
      description: fields[3] as String?,
      url: fields[4] as String?,
      urlToImage: fields[5] as String?,
      publishedAt: fields[6] as DateTime?,
      content: fields[7] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, NewsModelEntity obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.sourceName)
      ..writeByte(1)
      ..write(obj.author)
      ..writeByte(2)
      ..write(obj.title)
      ..writeByte(3)
      ..write(obj.description)
      ..writeByte(4)
      ..write(obj.url)
      ..writeByte(5)
      ..write(obj.urlToImage)
      ..writeByte(6)
      ..write(obj.publishedAt)
      ..writeByte(7)
      ..write(obj.content);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NewsModelEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
