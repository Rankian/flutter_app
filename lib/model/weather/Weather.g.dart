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
          : Result.fromJson(json['result'] as Map<String, dynamic>),
      json['code'] as String,
      json['value'] == null
          ? null
          : RealTime.fromJson(json['value'][0]['realtime'] as Map<String, dynamic>),
      (json['value'][0]['weathers'] as List)
          ?.map((e) => e == null ? null : F.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['value'] == null
          ? null
          : WeatherDetailsInfo.fromJson(
              json['value'][0]['weatherDetailsInfo'] as Map<String, dynamic>));
}

Map<String, dynamic> _$WeatherToJson(Weather instance) => <String, dynamic>{
      'resultcode': instance.resultcode,
      'reason': instance.reason,
      'result': instance.result,
      'code': instance.code,
      'value': instance.value,
      'realtime': instance.realtime,
      'weathers': instance.weathers,
      'weatherDetailsInfo': instance.weatherDetailsInfo
    };
