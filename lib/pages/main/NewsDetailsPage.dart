import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class NewsDetailsPage extends StatefulWidget {
  String url;
  NewsDetailsPage(this.url);

  @override
  NewsDetailsState createState()  => NewsDetailsState(url);
}

class NewsDetailsState extends State<NewsDetailsPage> {
  String url;

  NewsDetailsState(this.url);

  @override
  Widget build(BuildContext context) {
    return new WebviewScaffold(
      url: url,
      appBar: new AppBar(
        title: new Text("详情",
        style: new TextStyle(color: Colors.white, fontSize: 18.0)),
        centerTitle: true,
      ),
      withZoom: true,  // 允许网页缩放
      withLocalStorage: true, // 允许LocalStorage
      withJavascript: true, // 允许执行js代码
    );
  }
}