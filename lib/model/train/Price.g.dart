// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Price.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Price _$PriceFromJson(Map<String, dynamic> json) {
  return Price(json['price'], json['promotionPrice'],
      json['seatName'] as String, json['seatStatus'], json['leftNumber'] as int,);
}

Map<String, dynamic> _$PriceToJson(Price instance) => <String, dynamic>{
      'price': instance.price,
      'promotionPrice': instance.promotionPrice,
      'seatName': instance.seatName
    };
