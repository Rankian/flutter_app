import 'package:banner/banner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/pages/main/ContentPage.dart';

class MainPage extends StatefulWidget {
  @override
  MainPageState createState() => new MainPageState();
}

class MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  final images = [
    "images/banner1.jpg",
    "images/banner4.jpg",
    "images/banner3.jpg"
  ];

  TabController _tabController;

  @override
  void initState() {
    _tabController = new TabController(length: 10, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new SingleChildScrollView(
        child: new Column(
          children: <Widget>[
            new BannerView(
              delayTime: 5,
              height: 180,
              data: images,
              buildShowView: (index, data) {
                return new Image.asset(
                  data,
                  fit: BoxFit.fill,
                );
              },
              onBannerClickListener: (index, data) {
                print("点击的是:" + index.toString());
              },
            ),
            new TabBar(
                isScrollable: true,
                controller: _tabController,
                indicatorColor: Colors.blue,
                unselectedLabelColor: Colors.blue[200],
                labelColor: Colors.blue,
                tabs: <Widget>[
                  new Tab(text: "头条"),
                  new Tab(text: "社会"),
                  new Tab(text: "国内"),
                  new Tab(text: "国际"),
                  new Tab(text: "娱乐"),
                  new Tab(text: "体育"),
                  new Tab(text: "军事"),
                  new Tab(text: "科技"),
                  new Tab(text: "财经"),
                  new Tab(text: "时尚"),
                ]),
            new Container(
              height: 500,
              child: new TabBarView(
                  controller: _tabController,
                  children: <Widget>[
                    ContentPage("top"),
                    ContentPage("shehui"),
                    ContentPage("guonei"),
                    ContentPage("guoji"),
                    ContentPage("yule"),
                    ContentPage("tiyu"),
                    ContentPage("junshi"),
                    ContentPage("keji"),
                    ContentPage("caijing"),
                    ContentPage("shishang"),
                  ]),
            )
          ],
        ),
      ),
    );
  }
}
