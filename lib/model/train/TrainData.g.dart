// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'TrainData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrainData _$TrainDataFromJson(Map<String, dynamic> json) {
  return TrainData((json['list'] as List)
      ?.map(
          (e) => e == null ? null : Ticket.fromJson(e as Map<String, dynamic>))
      ?.toList());
}

Map<String, dynamic> _$TrainDataToJson(TrainData instance) =>
    <String, dynamic>{'list': instance.list};
