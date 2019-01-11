import 'package:flutter_app/model/train/Price.dart';
import 'package:json_annotation/json_annotation.dart';

part 'Ticket.g.dart';
@JsonSerializable()
class Ticket{
  String trainNum;
  int trainType;
  String trainTypeName;
  String departStationName;
  String destStationName;
  String departDepartTime;
  String destArriveTime;
  int duration;
  String durationStr;
  List<Price> prices;

  Ticket(this.trainNum, this.trainType, this.trainTypeName, this.departStationName,
      this.destStationName, this.departDepartTime, this.destArriveTime,
      this.duration, this.durationStr, this.prices);

  factory Ticket.fromJson(Map<String, dynamic> json) => _$TicketFromJson(json);
}