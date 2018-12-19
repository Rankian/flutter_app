// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'NewsInfo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsInfo _$NewsInfoFromJson(Map<String, dynamic> json) {
  return NewsInfo(
      json['reason'] as String,
      json['result'] == null
          ? null
          : Result.fromJson(json['result'] as Map<String, dynamic>));
}

Map<String, dynamic> _$NewsInfoToJson(NewsInfo instance) =>
    <String, dynamic>{'reason': instance.reason, 'result': instance.result};
