import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'Imprint.g.dart';
@JsonSerializable()
class Imprint{
  int praiseCount;
  int viewingCount;
  String authorAvatar;
  String uploadTime;
  String authorName;
  String address;
  String coverImage;

  Imprint(this.praiseCount, this.viewingCount, this.authorAvatar,
      this.uploadTime, this.authorName, this.address, this.coverImage);

  factory Imprint.fromJson(Map<String, dynamic> json) => _$ImprintFromJson(json);

  String toJson() => jsonEncode(_$ImprintToJson(this));
}