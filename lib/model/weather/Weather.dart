import 'package:flutter_app/model/weather/Result.dart';
import 'package:flutter_app/model/weather/WeatherDetailsInfo.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:flutter_app/model/weather/Value.dart';
import 'package:flutter_app/model/weather/RealTime.dart';
import 'package:flutter_app/model/weather/F.dart';

part 'Weather.g.dart';
@JsonSerializable()
class Weather {
  String resultcode;
  String reason;
  Result result;
  //魅族天气
  String code;
  Value value;
  RealTime realtime;
  List<F> weathers;
  WeatherDetailsInfo weatherDetailsInfo;

  Weather(this.resultcode, this.reason, this.result, this.code, this.realtime, this.weathers, this.weatherDetailsInfo);

  factory Weather.fromJson(Map<String, dynamic> json) => _$WeatherFromJson(json);

  @override
  String toString() {
    return 'Weather{resultcode: $resultcode, reason: $reason, result: $result}';
  }

}
