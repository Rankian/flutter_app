import 'package:flutter/material.dart';
import 'package:flutter_app/pages/DiscoverPage.dart';
import 'package:flutter_app/pages/imprint/ImprintPage.dart';
import 'package:flutter_app/pages/main/MainPage.dart';
import 'package:flutter_app/pages/PersonalPage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() {
    return new _HomePageState();
  }
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  int _index = 0;
  var _bodys;

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
//    _startLocation();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new TabBarView(
          controller: _tabController, children: <Widget>[_bodys[_index]]),
      bottomNavigationBar: new BottomNavigationBar(
        iconSize: 20,
        items: <BottomNavigationBarItem>[
          new BottomNavigationBarItem(
              icon: new Icon(Icons.home),
              title: new Text(
                "首页",
                style: TextStyle(fontSize: 12),
              )),
          new BottomNavigationBarItem(
              icon: new Icon(Icons.stars),
              title: new Text("发现", style: TextStyle(fontSize: 12))),
          new BottomNavigationBarItem(
              icon: new Icon(Icons.movie),
              title: new Text("印记", style: TextStyle(fontSize: 12))),
          new BottomNavigationBarItem(
              icon: new Icon(Icons.person),
              title: new Text("我的", style: TextStyle(fontSize: 12)))
        ],
        type: BottomNavigationBarType.fixed,
        currentIndex: _index,
        onTap: (index) {
          setState(() {
            _index = index;
          });
        },
      ),
    );
  }
}
