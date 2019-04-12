import 'package:json_annotation/json_annotation.dart';

part 'Message.g.dart';
@JsonSerializable()
class Message {
  int isNew;
  String senderTime;
  String senderAvatar;
  String senderName;
  String content;

  Message(this.isNew, this.senderTime, this.senderAvatar, this.senderName,
      this.content);

  factory Message.fromJson(Map<String, dynamic> json) => _$MessageFromJson(json);
}