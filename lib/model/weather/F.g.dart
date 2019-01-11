// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'F.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

F _$FFromJson(Map<String, dynamic> json) {
  return F(
      json['date'] as String,
      json['img'] as String,
      json['sun_down_time'] as String,
      json['sun_rise_time'] as String,
      json['temp_day_c'] as String,
      json['temp_day_f'] as String,
      json['temp_night_c'] as String,
      json['temp_night_f'] as String,
      json['wd'] as String,
      json['weather'] as String,
      json['week'] as String,
      json['ws'] as String);
}

Map<String, dynamic> _$FToJson(F instance) => <String, dynamic>{
      'date': instance.date,
      'img': instance.img,
      'sun_down_time': instance.sun_down_time,
      'sun_rise_time': instance.sun_rise_time,
      'temp_day_c': instance.temp_day_c,
      'temp_day_f': instance.temp_day_f,
      'temp_night_c': instance.temp_night_c,
      'temp_night_f': instance.temp_night_f,
      'wd': instance.wd,
      'weather': instance.weather,
      'week': instance.week,
      'ws': instance.ws
    };
