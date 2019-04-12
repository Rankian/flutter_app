// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Message _$MessageFromJson(Map<String, dynamic> json) {
  return Message(
      json['isNew'] as int,
      json['senderTime'] as String,
      json['senderAvatar'] as String,
      json['senderName'] as String,
      json['content'] as String);
}

Map<String, dynamic> _$MessageToJson(Message instance) => <String, dynamic>{
      'isNew': instance.isNew,
      'senderTime': instance.senderTime,
      'senderAvatar': instance.senderAvatar,
      'senderName': instance.senderName,
      'content': instance.content
    };
