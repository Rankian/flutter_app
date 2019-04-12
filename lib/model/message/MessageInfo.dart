import 'package:flutter_app/model/message/Message.dart';
import 'package:json_annotation/json_annotation.dart';

part 'MessageInfo.g.dart';
@JsonSerializable()
class MessageInfo{
  List<Message> results;

  MessageInfo(this.results);

  factory MessageInfo.fromJson(Map<String, dynamic> json) => _$MessageInfoFromJson(json);
}