// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Imprint.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Imprint _$ImprintFromJson(Map<String, dynamic> json) {
  return Imprint(
      json['praiseCount'] as int,
      json['viewingCount'] as int,
      json['authorAvatar'] as String,
      json['uploadTime'] as String,
      json['authorName'] as String,
      json['address'] as String,
      json['coverImage'] as String);
}

Map<String, dynamic> _$ImprintToJson(Imprint instance) => <String, dynamic>{
      'praiseCount': instance.praiseCount,
      'viewingCount': instance.viewingCount,
      'authorAvatar': instance.authorAvatar,
      'uploadTime': instance.uploadTime,
      'authorName': instance.authorName,
      'address': instance.address,
      'coverImage': instance.coverImage
    };
