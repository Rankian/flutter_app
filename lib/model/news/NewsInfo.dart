import 'package:flutter_app/model/news/Result.dart';
import 'package:json_annotation/json_annotation.dart';

part 'NewsInfo.g.dart';
@JsonSerializable()
class NewsInfo{
  String reason;
  Result result;


  NewsInfo(this.reason, this.result);

  factory NewsInfo.fromJson(Map<String, dynamic> json) => _$NewsInfoFromJson(json);
}