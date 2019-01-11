import 'package:json_annotation/json_annotation.dart';

part 'RealTime.g.dart';
@JsonSerializable()
class RealTime {
  String sD;
  String sendibleTemp;
  String temp;
  String time;
  String wD;
  String wS;
  String weather;
  String ziwaixian;

  RealTime(this.sD, this.sendibleTemp, this.temp, this.time, this.wD, this.wS,
      this.weather, this.ziwaixian);
  factory RealTime.fromJson(Map<String, dynamic> json) => _$RealTimeFromJson(json);

}