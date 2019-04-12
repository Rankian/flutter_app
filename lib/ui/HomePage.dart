import 'package:flutter/material.dart';
import 'package:flutter_app/base/BasePage.dart';
import 'package:flutter_app/pages/discover/DiscoverPage.dart';
import 'package:flutter_app/pages/imprint/ImprintPage.dart';
import 'package:flutter_app/pages/main/MainPage.dart';
import 'package:flutter_app/pages/user/PersonalPage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() {
    return new _HomePageState();
  }
}

class _HomePageState extends BaseState<HomePage>
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

  int _last = 0;
  Future<bool> _onWillPop(){
    int now = DateTime.now().millisecondsSinceEpoch;
    if(now - _last > 2000){
      _last = now;
      showToast("再按一次退出应用");
    }else{
      return Future.value(true);
    }
    return Future.value(false);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: _onWillPop,
        child: Scaffold(
          body: TabBarView(
              controller: _tabController, children: <Widget>[_bodys[_index]]),
          bottomNavigationBar: BottomNavigationBar(
            iconSize: 20,
            items: <BottomNavigationBarItem>[
              new BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  title: Text(
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
        ));
  }
}
