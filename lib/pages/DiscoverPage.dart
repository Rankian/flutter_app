import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/model/weather/Weather.dart';

class DiscoverPage extends StatefulWidget {
  @override
  DiscoverState createState() => new DiscoverState();
}

class DiscoverState extends State<DiscoverPage> {
  Weather weather;

  @override
  void initState() {
    super.initState();
//    _requestWeather("重庆市");
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new ListView(
        children: <Widget>[
          new Center(
              child: new Container(
            height: 200,
            child: new Center(
                child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    new Text(
                      weather == null ? "10" : weather.result.sk.temp,
                      style: new TextStyle(
                          fontSize: 50.0,
                          color: Colors.blue,
                          fontWeight: FontWeight.bold),
                    ),
                    new Text(
                      "℃",
                      style: new TextStyle(fontSize: 14.0, color: Colors.blue),
                    ),
                  ],
                ),
                new Text(
                  weather == null ? "重庆市" : weather.result.today.city,
                  style: new TextStyle(fontSize: 14.0, color: Colors.blue),
                ),
              ],
            )),
          )),
        ],
      ),
    );
  }

  Future _requestWeather(String city) async {
    Dio dio = new Dio();
    Response response = await dio.get(
        "http://v.juhe.cn/weather/index?key=057533f70adfa2ac63765b88fc5dcb6a&cityname=" +
            city);
    setState(() {
      weather = Weather.fromJson(response.data);
    });
  }
}
