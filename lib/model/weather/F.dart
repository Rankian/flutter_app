import 'package:json_annotation/json_annotation.dart';

part 'F.g.dart';
@JsonSerializable()
class F {
  String date;
  String img;
  String sun_down_time;
  String sun_rise_time;
  String temp_day_c;
  String temp_day_f;
  String temp_night_c;
  String temp_night_f;
  String wd;
  String weather;
  String week;
  String ws;

  F(this.date, this.img, this.sun_down_time, this.sun_rise_time,
      this.temp_day_c, this.temp_day_f, this.temp_night_c, this.temp_night_f,
      this.wd, this.weather, this.week, this.ws);

  factory F.fromJson(Map<String, dynamic> json) => _$FFromJson(json);

}
