// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'MessageInfo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MessageInfo _$MessageInfoFromJson(Map<String, dynamic> json) {
  return MessageInfo((json['results'] as List)
      ?.map(
          (e) => e == null ? null : Message.fromJson(e as Map<String, dynamic>))
      ?.toList());
}

Map<String, dynamic> _$MessageInfoToJson(MessageInfo instance) =>
    <String, dynamic>{'results': instance.results};
