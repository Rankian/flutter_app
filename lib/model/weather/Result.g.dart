// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Result _$ResultFromJson(Map<String, dynamic> json) {
  return Result(
      json['sk'] == null
          ? null
          : Sk.fromJson(json['sk'] as Map<String, dynamic>),
      json['today'] == null
          ? null
          : Today.fromJson(json['today'] as Map<String, dynamic>))
    ..future = (json['future'] as List)
        ?.map((e) => e == null ? null : F.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$ResultToJson(Result instance) => <String, dynamic>{
      'sk': instance.sk,
      'today': instance.today,
      'future': instance.future
    };
