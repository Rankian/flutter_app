import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class WalletPage extends StatefulWidget{
  @override
  _WalletPage createState() => new _WalletPage();
}

class _WalletPage extends State<WalletPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("我的钱包", style: new TextStyle(color: Colors.white, fontSize: 18.0)),
        centerTitle: true,
      ),
      body: new ListView(
        children: <Widget>[

        ],
      ),
    );
  }

  void _request(){
    Dio dio = new Dio();
    dio.get("");
    Response<String> response= dio.get("https://www.baidu.com/") as Response<String>;
    print(response.data);
  }
}