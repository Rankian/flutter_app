import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class User{
  String username;
  int sex;
  int age;
  String password;
  String cardNo;

  User(this.username, this.sex, this.age, this.password, this.cardNo);
}