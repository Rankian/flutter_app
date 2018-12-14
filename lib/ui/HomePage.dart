import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/pages/DiscoverPage.dart';
import 'package:flutter_app/pages/ImprintPage.dart';
import 'package:flutter_app/pages/MainPage.dart';
import 'package:flutter_app/pages/PersonalPage.dart';
import 'package:flutter_app/ui/WalletPage.dart';
import 'package:amap_location/amap_location.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() {
    return new _HomePageState();
  }
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  final String _picUrl =
      "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1544607074287&di=c67b64c04e30e7ca465e029f038a2495&imgtype=0&src=http%3A%2F%2Ff.hiphotos.baidu.com%2Fimage%2Fpic%2Fitem%2F9f510fb30f2442a7b4cabe5dd443ad4bd0130205.jpg";
  TabController _tabController;

  int _index = 0;
  var _bodys;
  var _title = "首页";

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: 2, vsync: this);
    _bodys = [
      new MainPage(),
      new DiscoverPage(),
      new ImprintPage(),
      new PersonalPage()
    ];
    _startLocation();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(_title,
            style: new TextStyle(color: Colors.white, fontSize: 18.0)),
        centerTitle: true,
      ),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: new Text("SanJie"),
              accountEmail: new Text("ali123@163.com"),
              currentAccountPicture: new GestureDetector(
                  onTap: () {
                    print('current user');
                  },
                  child: CircleAvatar(
                    backgroundImage: new ExactAssetImage("images/avatar.jpg"),
                  )),
            ),
            new ListTile(
              title: new Text("我的钱包"),
              trailing: new Icon(Icons.chevron_right),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) => new WalletPage()));
              },
            ),
            new Divider(),
            new ListTile(
              title: new Text("个性装扮"),
              trailing: new Icon(Icons.chevron_right),
              onTap: () {
                _request("重庆市");
              },
            ),
            new Divider(),
            new ListTile(
              title: new Text("设\u3000置"),
              trailing: new Icon(Icons.chevron_right),
              onTap: () {},
            )
          ],
        ),
      ),
      body: new TabBarView(controller: _tabController, children: <Widget>[
        _bodys[_index]
      ]),
      bottomNavigationBar: new BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          new BottomNavigationBarItem(
              icon: new Icon(Icons.home),
              title: new Text("首页")),
          new BottomNavigationBarItem(
              icon: new Icon(Icons.stars),
              title: new Text("发现")),
          new BottomNavigationBarItem(
              icon: new Icon(Icons.movie),
              title: new Text("印记")),
          new BottomNavigationBarItem(
              icon: new Icon(Icons.person),
              title: new Text("我的"))
        ],
        type: BottomNavigationBarType.fixed,
        currentIndex: _index,
        onTap: (index) {
          setState(() {
            _index = index;
            switch(_index){
              case 0:
                _title = "首页";
                break;
              case 1:
                _title = "发现";
                break;
              case 2:
                _title = "印记";
                break;
              case 3:
                _title = "个人中心";
                break;
            }
          });
        },
      ),
    );
  }

  Future _request(String city) async {
    Dio dio = new Dio();
    Response response = await dio.get(
        "http://v.juhe.cn/weather/index?key=057533f70adfa2ac63765b88fc5dcb6a&cityname=重庆市");
    print("请求数据:" + json.encode(response.data));
  }

  Future _startLocation() async {
    await AMapLocationClient.startup(new AMapLocationOption(desiredAccuracy: CLLocationAccuracy.kCLLocationAccuracyHundredMeters));
    await AMapLocationClient.getLocation(true);
    AMapLocationClient.onLocationUpate.listen((AMapLocation location){
      if(!mounted)return;
      print("定位成功:" + location.street);
      setState(() {

      });
    });
  }
}
