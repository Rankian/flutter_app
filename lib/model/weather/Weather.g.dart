// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Weather _$WeatherFromJson(Map<String, dynamic> json) {
  return Weather(
      json['resultcode'] as String,
      json['reason'] as String,
      json['result'] == null
          ? null
          : Result.fromJson(json['result'] as Map<String, dynamic>));
}

Map<String, dynamic> _$WeatherToJson(Weather instance) => <String, dynamic>{
      'resultcode': instance.resultcode,
      'reason': instance.reason,
      'result': instance.result
    };
