import 'package:flutter_app/model/train/Ticket.dart';
import 'package:flutter_app/model/train/TrainData.dart';
import 'package:json_annotation/json_annotation.dart';

part 'TrainTicket.g.dart';
@JsonSerializable()
class TrainTicket{
  int code;
  TrainData data;
  List<Ticket> list;

  TrainTicket(this.code, this.list);

  factory TrainTicket.fromJson(Map<String, dynamic> json) => _$TrainTicketFromJson(json);
}