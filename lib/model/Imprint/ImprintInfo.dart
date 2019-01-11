import 'package:flutter_app/model/Imprint/Imprint.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ImprintInfo.g.dart';
@JsonSerializable()
class ImprintInfo{
  List<Imprint> results;

  ImprintInfo(this.results);

  factory ImprintInfo.fromJson(Map<String, dynamic> json) => _$ImprintInfoFromJson(json);
}