import 'package:json_annotation/json_annotation.dart';
part 'Price.g.dart';
@JsonSerializable()
class Price {
  var price;
  var promotionPrice;
  String seatName;
  var seatStatus;
  int leftNumber;

  Price(this.price, this.promotionPrice, this.seatName, this.seatStatus, this.leftNumber);

  factory Price.fromJson(Map<String, dynamic> json) => _$PriceFromJson(json);
}