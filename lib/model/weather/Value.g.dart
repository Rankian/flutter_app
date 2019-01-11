// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Value.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Value _$ValueFromJson(Map<String, dynamic> json) {
  return Value((json['realTime'] as List)
      ?.map((e) =>
          e == null ? null : RealTime.fromJson(e as Map<String, dynamic>))
      ?.toList());
}

Map<String, dynamic> _$ValueToJson(Value instance) =>
    <String, dynamic>{'realTime': instance.realTime};
