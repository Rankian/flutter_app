// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'WeatherHourDetail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherHourDetail _$WeatherHourDetailFromJson(Map<String, dynamic> json) {
  return WeatherHourDetail(
      json['endTime'] as String,
      json['highestTemperature'] as String,
      json['img'] as String,
      json['isRainFall'] as String,
      json['lowerestTemperature'] as String,
      json['precipitation'] as String,
      json['startTime'] as String,
      json['wd'] as String,
      json['weather'] as String,
      json['ws'] as String);
}

Map<String, dynamic> _$WeatherHourDetailToJson(WeatherHourDetail instance) =>
    <String, dynamic>{
      'endTime': instance.endTime,
      'highestTemperature': instance.highestTemperature,
      'img': instance.img,
      'isRainFall': instance.isRainFall,
      'lowerestTemperature': instance.lowerestTemperature,
      'precipitation': instance.precipitation,
      'startTime': instance.startTime,
      'wd': instance.wd,
      'weather': instance.weather,
      'ws': instance.ws
    };
