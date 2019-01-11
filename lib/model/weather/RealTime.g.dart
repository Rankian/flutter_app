// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'RealTime.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RealTime _$RealTimeFromJson(Map<String, dynamic> json) {
  return RealTime(
      json['sD'] as String,
      json['sendibleTemp'] as String,
      json['temp'] as String,
      json['time'] as String,
      json['wD'] as String,
      json['wS'] as String,
      json['weather'] as String,
      json['ziwaixian'] as String);
}

Map<String, dynamic> _$RealTimeToJson(RealTime instance) => <String, dynamic>{
      'sD': instance.sD,
      'sendibleTemp': instance.sendibleTemp,
      'temp': instance.temp,
      'time': instance.time,
      'wD': instance.wD,
      'wS': instance.wS,
      'weather': instance.weather,
      'ziwaixian': instance.ziwaixian
    };
