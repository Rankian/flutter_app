import 'package:json_annotation/json_annotation.dart';

part 'User.g.dart';

@JsonSerializable()
class User{
  String username;
  String mobilePhoneNumber;
  String nickname;
  int sex;
  int age;
  String password;
  String cardNo;
  String avatar;
  String birthday;
  int gender;
  String address;

  User(this.username, this.sex, this.age, this.password, this.cardNo, this.mobilePhoneNumber, this.nickname, this.avatar,
      this.birthday, this.gender, this.address);

  factory User.fromJSON(Map<String, dynamic> json) => _$UserFromJson(json);
}