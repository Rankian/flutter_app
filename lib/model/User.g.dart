// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'User.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(json['username'] as String, json['sex'] as int,
      json['age'] as int, json['password'] as String, json['cardNo'] as String);
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'username': instance.username,
      'sex': instance.sex,
      'age': instance.age,
      'password': instance.password,
      'cardNo': instance.cardNo
    };
