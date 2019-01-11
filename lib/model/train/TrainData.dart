import 'package:flutter_app/model/train/Ticket.dart';
import 'package:json_annotation/json_annotation.dart';

part 'TrainData.g.dart';
@JsonSerializable()
class TrainData {
  List<Ticket> list;

  TrainData(this.list);
  factory TrainData.fromJson(Map<String, dynamic> json) => _$TrainDataFromJson(json);
}