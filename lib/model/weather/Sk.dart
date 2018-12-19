import 'package:json_annotation/json_annotation.dart';

part 'Sk.g.dart';
@JsonSerializable()
class Sk{
  String temp;
  String wind_direction;
  String wind_strength;
  String humidity;
  String time;

  Sk(this.temp, this.wind_direction, this.wind_strength, this.humidity,
      this.time);

  @override
  String toString() {
    return 'Sk{temp: $temp, wind_direction: $wind_direction, wind_strength: $wind_strength, humidity: $humidity, time: $time}';
  }

  factory Sk.fromJson(Map<String, dynamic> json) => _$SkFromJson(json);
}