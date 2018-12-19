import 'package:flutter_app/model/news/News.dart';
import 'package:json_annotation/json_annotation.dart';
part 'Result.g.dart';
@JsonSerializable()
class Result{
  String stat;
  List<News> data;


  Result(this.stat, this.data);

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);
}