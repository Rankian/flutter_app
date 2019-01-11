import 'package:json_annotation/json_annotation.dart';
import 'package:flutter_app/model/weather/RealTime.dart';

part 'Value.g.dart';
@JsonSerializable()
class Value{
  List<RealTime> realTime;

  Value(this.realTime);
  factory Value.fromJson(Map<String, dynamic> json) => _$ValueFromJson(json);

}