// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'User.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
      json['username'] as String,
      json['sex'] as int,
      json['age'] as int,
      json['password'] as String,
      json['cardNo'] as String,
      json['mobilePhoneNumber'] as String,
      json['nickname'] as String,
      json['avatar'] as String,
      json['birthday'] as String,
      json['gender'] as int,
      json['address'] as String);
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'username': instance.username,
      'mobilePhoneNumber': instance.mobilePhoneNumber,
      'nickname': instance.nickname,
      'sex': instance.sex,
      'age': instance.age,
      'password': instance.password,
      'cardNo': instance.cardNo,
      'avatar': instance.avatar,
      'birthday': instance.birthday,
      'gender': instance.gender,
      'address': instance.address
    };
