import 'package:flutter/material.dart';
import 'package:flutter_app/pages/main/ContentPage.dart';

class MainPage extends StatefulWidget {
  @override
  MainPageState createState() => new MainPageState();
}

class MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
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
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: PreferredSize(child: AppBar(backgroundColor: Colors.red, elevation: 0,), preferredSize: Size.fromHeight(0)),
      body: SafeArea(child: new Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(
                left: 15.0, top: 10, right: 15.0, bottom: 5),
            height: 50,
            decoration: BoxDecoration(color: Colors.red),
            child: Container(
              padding: EdgeInsets.only(
                  left: 10.0, top: 5.0, right: 10.0, bottom: 5.0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(5.0))),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Icon(
                    Icons.search,
                    color: Colors.grey,
                    size: 18,
                  ),
                  GestureDetector(
                    onTap: (){_caculatePadding(context);},
                    child: Text(
                      "个人所得税app | 轨道环线 | 沪汉渝蓉沿江高铁",
                      style: TextStyle(color: Colors.grey, fontSize: 12.0),
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            height: 36,
            child: new TabBar(
                isScrollable: true,
                controller: _tabController,
                indicatorColor: Colors.red,
                unselectedLabelColor: Colors.black,
                labelColor: Colors.red,
                labelStyle: TextStyle(fontSize: 12.0),
                unselectedLabelStyle: TextStyle(fontSize: 12.0),
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
          ),
          Expanded(
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
              ],
            ),
          )
        ],
      ),)
    );
  }

  void _caculatePadding(BuildContext context){
    double top = MediaQuery.of(context).padding.top;
    double bottom = MediaQuery.of(context).padding.bottom;
    print("top:$top, bottom: $bottom");
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
