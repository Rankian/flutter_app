import 'package:flutter_app/model/weather/Sk.dart';
import 'package:flutter_app/model/weather/Today.dart';
import 'package:json_annotation/json_annotation.dart';

part 'Result.g.dart';
@JsonSerializable()
class Result{
  Sk sk;
  Today today;


  Result(this.sk, this.today);


  @override
  String toString() {
    return 'Result{sk: $sk, today: $today}';
  }

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);
}