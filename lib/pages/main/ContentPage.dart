import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/model/news/News.dart';
import 'package:flutter_app/model/news/NewsInfo.dart';
import 'package:flutter_app/pages/main/NewsDetailsPage.dart';

class ContentPage extends StatefulWidget {
  String type;

  ContentPage(this.type);

  @override
  ContentState createState() => new ContentState(type);
}

class ContentState extends State<ContentPage>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  String type;
  List<News> newsList;

  ContentState(this.type);

  @override
  void initState() {
    newsList = new List();
    _requestNews(type);
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Container(
        decoration: BoxDecoration(color: Colors.grey[200]),
        child: newsList == null ? Center(child: CircularProgressIndicator(strokeWidth: 2.0),)
            : new ListView.builder(
            itemCount: newsList.length,
            itemBuilder: (context, i) {
              return new GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(new MaterialPageRoute(
                        builder: (BuildContext context) =>
                        new NewsDetailsPage(newsList[i].url)));
                  },
                  child: new Container(
                    padding: EdgeInsets.all(8.0),
                    margin: EdgeInsets.only(
                        bottom: 10.0, left: 10.0, right: 10.0),
                    decoration: BoxDecoration(
                        borderRadius:
                        BorderRadius.all(Radius.circular(10.0)),
                        color: Colors.white),
                    child: new Row(
                      children: <Widget>[
                        ClipRRect(
                          child: new CachedNetworkImage(
                              width: 90,
                              imageUrl: newsList[i].thumbnail_pic_s),
                          borderRadius:
                          BorderRadius.all(Radius.circular(5.0)),
                        ),
                        Expanded(
                            child: new Container(
                              padding: EdgeInsets.all(10.0),
                              child: new Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  new Text(
                                    newsList[i].title,
                                    style: new TextStyle(
                                      color: Colors.black,
                                      fontSize: 16.0,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  new Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      new Text(newsList[i].date,
                                          style: new TextStyle(
                                              color: Colors.grey[400],
                                              fontSize: 10.0)),
                                      new Text(
                                        newsList[i].author_name,
                                        style: new TextStyle(
                                          color: Colors.grey[400],
                                          fontSize: 10.0,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ))
                      ],
                    ),
                  ));
            }),
      )
    );
  }

  Future _requestNews(String type) async {
    Dio dio = new Dio();
    Response response = await dio.get(
        "http://v.juhe.cn/toutiao/index?key=7e4eead6fe2c3d29fca66c5e7580cc2a&type=" +
            type);
    NewsInfo newsInfo = NewsInfo.fromJson(response.data);
    setState(() {
      newsList.addAll(newsInfo.result.data);
    });
  }
}
