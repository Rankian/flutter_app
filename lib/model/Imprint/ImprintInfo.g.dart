// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ImprintInfo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImprintInfo _$ImprintInfoFromJson(Map<String, dynamic> json) {
  return ImprintInfo((json['results'] as List)
      ?.map(
          (e) => e == null ? null : Imprint.fromJson(e as Map<String, dynamic>))
      ?.toList());
}

Map<String, dynamic> _$ImprintInfoToJson(ImprintInfo instance) =>
    <String, dynamic>{'results': instance.results};
