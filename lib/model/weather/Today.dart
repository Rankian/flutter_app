import 'package:json_annotation/json_annotation.dart';

part 'Today.g.dart';
@JsonSerializable()
class Today{
  String city;
  String date_y;
  String week;
  String temperature;
  String weather;
  String wind;
  String dressing_index;
  String dressing_advice;
  String uv_index;
  String comfort_index;
  String wash_index;
  String travel_index;
  String exercise_index;

  Today(this.city, this.date_y, this.week, this.temperature, this.weather,
      this.wind, this.dressing_index, this.dressing_advice, this.uv_index,
      this.comfort_index, this.wash_index, this.travel_index,
      this.exercise_index);


  @override
  String toString() {
    return 'Today{city: $city, date_y: $date_y, week: $week, temperature: $temperature, weather: $weather, wind: $wind, dressing_index: $dressing_index, dressing_advice: $dressing_advice, uv_index: $uv_index, comfort_index: $comfort_index, wash_index: $wash_index, travel_index: $travel_index, exercise_index: $exercise_index}';
  }

  factory Today.fromJson(Map<String, dynamic> json) => _$TodayFromJson(json);
}