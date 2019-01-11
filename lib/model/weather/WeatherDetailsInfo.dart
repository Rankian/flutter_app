import 'package:flutter_app/model/weather/WeatherHourDetail.dart';
import 'package:json_annotation/json_annotation.dart';

part 'WeatherDetailsInfo.g.dart';
@JsonSerializable()
class WeatherDetailsInfo{
  List<WeatherHourDetail> weather3HoursDetailsInfos;

  WeatherDetailsInfo(this.weather3HoursDetailsInfos);

  factory WeatherDetailsInfo.fromJson(Map<String, dynamic> json) => _$WeatherDetailsInfoFromJson(json);
}