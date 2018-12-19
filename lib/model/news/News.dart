import 'package:json_annotation/json_annotation.dart';
part 'News.g.dart';
@JsonSerializable()
class News{
  String uniquekey;
  String title;
  String date;
  String category;
  String author_name;
  String url;
  String thumbnail_pic_s;
  String thumbnail_pic_s02;
  String thumbnail_pic_s03;


  News(this.uniquekey, this.title, this.date, this.category, this.author_name,
      this.url, this.thumbnail_pic_s, this.thumbnail_pic_s02,
      this.thumbnail_pic_s03);

  factory News.fromJson(Map<String, dynamic> json) => _$NewsFromJson(json);
}