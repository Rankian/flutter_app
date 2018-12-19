import 'package:flutter_app/model/weather/Result.dart';
import 'package:json_annotation/json_annotation.dart';

part 'Weather.g.dart';
@JsonSerializable()
class Weather {
  String resultcode;
  String reason;
  Result result;


  Weather(this.resultcode, this.reason, this.result);

  factory Weather.fromJson(Map<String, dynamic> json) => _$WeatherFromJson(json);

  @override
  String toString() {
    return 'Weather{resultcode: $resultcode, reason: $reason, result: $result}';
  }


}
