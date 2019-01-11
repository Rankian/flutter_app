// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'TrainTicket.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrainTicket _$TrainTicketFromJson(Map<String, dynamic> json) {
  return TrainTicket(
      json['code'] as int,
      (json['data']['list'] as List)
          ?.map(
              (e) => e == null ? null : Ticket.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$TrainTicketToJson(TrainTicket instance) =>
    <String, dynamic>{'code': instance.code, 'data': instance.data};
