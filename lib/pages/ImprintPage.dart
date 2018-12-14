import 'package:flutter/material.dart';

class ImprintPage extends StatefulWidget{
  @override
  ImprintState createState() => ImprintState();
}

class ImprintState extends State<ImprintPage>{
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: new Text("印记"),
      ),
    );
  }
}