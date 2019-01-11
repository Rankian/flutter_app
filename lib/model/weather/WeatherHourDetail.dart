import 'package:json_annotation/json_annotation.dart';

part 'WeatherHourDetail.g.dart';
@JsonSerializable()
class WeatherHourDetail{
  String endTime;
  String highestTemperature;
  String img;
  String isRainFall;
  String lowerestTemperature;
  String precipitation;
  String startTime;
  String wd;
  String weather;
  String ws;

  WeatherHourDetail(this.endTime, this.highestTemperature, this.img,
      this.isRainFall, this.lowerestTemperature, this.precipitation,
      this.startTime, this.wd, this.weather, this.ws);


  factory WeatherHourDetail.fromJson(Map<String, dynamic> json) => _$WeatherHourDetailFromJson(json);
}
