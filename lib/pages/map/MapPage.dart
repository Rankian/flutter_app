import 'package:flutter/material.dart';

class MapPage extends StatefulWidget {
  @override
  MapState createState() => MapState();
}

class MapState extends State<MapPage>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "火车票",
          style: TextStyle(color: Colors.white, fontSize: 18.0),
        ),
        centerTitle: true,
      ),
    );
  }
}