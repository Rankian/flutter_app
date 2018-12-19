// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Sk.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Sk _$SkFromJson(Map<String, dynamic> json) {
  return Sk(
      json['temp'] as String,
      json['wind_direction'] as String,
      json['wind_strength'] as String,
      json['humidity'] as String,
      json['time'] as String);
}

Map<String, dynamic> _$SkToJson(Sk instance) => <String, dynamic>{
      'temp': instance.temp,
      'wind_direction': instance.wind_direction,
      'wind_strength': instance.wind_strength,
      'humidity': instance.humidity,
      'time': instance.time
    };
