// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'News.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

News _$NewsFromJson(Map<String, dynamic> json) {
  return News(
      json['uniquekey'] as String,
      json['title'] as String,
      json['date'] as String,
      json['category'] as String,
      json['author_name'] as String,
      json['url'] as String,
      json['thumbnail_pic_s'] as String,
      json['thumbnail_pic_s02'] as String,
      json['thumbnail_pic_s03'] as String);
}

Map<String, dynamic> _$NewsToJson(News instance) => <String, dynamic>{
      'uniquekey': instance.uniquekey,
      'title': instance.title,
      'date': instance.date,
      'category': instance.category,
      'author_name': instance.author_name,
      'url': instance.url,
      'thumbnail_pic_s': instance.thumbnail_pic_s,
      'thumbnail_pic_s02': instance.thumbnail_pic_s02,
      'thumbnail_pic_s03': instance.thumbnail_pic_s03
    };
