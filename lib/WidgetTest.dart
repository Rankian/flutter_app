import 'package:flutter/material.dart';

class WidgetTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Material(
      child: new Column(
        children: <Widget>[
          new MyAppBar(new Text(
            "首页",
            style: Theme.of(context).primaryTextTheme.title,
          )),
          new Expanded(child: new Center(child: new Text("显示内容")))
        ],
      ),
    );
  }
}

class MyAppBar extends StatelessWidget {
  MyAppBar(this.title);
  final Widget title;
  @override
  Widget build(BuildContext context) {
    final _name = "";
    return new Container(
      height: 56.0,
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
      decoration: new BoxDecoration(color: Colors.blue[500]),
      child: new Row(
        //水平方向的布局
        children: <Widget>[
          new IconButton(
              icon: new Icon(Icons.arrow_back, color: Colors.white),
              tooltip: "navigation back",
             onPressed: null),
           new Expanded(child: title),
          new IconButton(
              icon: new Icon(Icons.menu, color: Colors.white),
              tooltip: "navigation menu",
              onPressed: null)
        ],
      ),
    );
  }

  Widget _createBanner() {
    return new ListView.builder(
        padding: const EdgeInsets.all(20.0),
        itemBuilder: (context, position) {

        });
  }

  void _pressed(String context) {
    print(context);
  }
}
