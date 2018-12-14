import 'package:flutter/material.dart';

class PersonalPage extends StatefulWidget{
  @override
  PersonalState createState() => PersonalState();
}

class PersonalState extends State<PersonalPage>{
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: new Text("我的"),
      ),
    );
  }
}