import 'package:flutter/material.dart';

class DiscoverPage extends StatefulWidget{
  @override
  DiscoverState createState() => new DiscoverState();
}

class DiscoverState extends State<DiscoverPage>{
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: new Text("发现"),
      ),
    );
  }
}