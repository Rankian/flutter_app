// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Ticket.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Ticket _$TicketFromJson(Map<String, dynamic> json) {
  return Ticket(
      json['trainNum'] as String,
      json['trainType'] as int,
      json['trainTypeName'] as String,
      json['departStationName'] as String,
      json['destStationName'] as String,
      json['departDepartTime'] as String,
      json['destArriveTime'] as String,
      json['duration'] as int,
      json['durationStr'] as String,
      (json['prices'] as List)
          ?.map((e) =>
              e == null ? null : Price.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$TicketToJson(Ticket instance) => <String, dynamic>{
      'trainNum': instance.trainNum,
      'trainTypeName': instance.trainTypeName,
      'departStationName': instance.departStationName,
      'destStationName': instance.destStationName,
      'departDepartTime': instance.departDepartTime,
      'destArriveTime': instance.destArriveTime,
      'duration': instance.duration,
      'durationStr': instance.durationStr,
      'prices': instance.prices
    };
