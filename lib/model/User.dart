import 'package:json_annotation/json_annotation.dart';

part 'User.g.dart';

@JsonSerializable()
class User{
  String username;
  int sex;
  int age;
  String password;
  String cardNo;

  User(this.username, this.sex, this.age, this.password, this.cardNo);

  factory User.fromJSON(Map<String, dynamic> json) => _$UserFromJson(json);
}