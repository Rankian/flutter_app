// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'WeatherDetailsInfo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherDetailsInfo _$WeatherDetailsInfoFromJson(Map<String, dynamic> json) {
  return WeatherDetailsInfo((json['weather3HoursDetailsInfos'] as List)
      ?.map((e) => e == null
          ? null
          : WeatherHourDetail.fromJson(e as Map<String, dynamic>))
      ?.toList());
}

Map<String, dynamic> _$WeatherDetailsInfoToJson(WeatherDetailsInfo instance) =>
    <String, dynamic>{
      'weather3HoursDetailsInfos': instance.weather3HoursDetailsInfos
    };
