import 'package:flutter/material.dart';
import 'package:flutter_app/model/User.dart';
import 'dart:convert';

class PersonalPage extends StatefulWidget{
  @override
  PersonalState createState() => PersonalState();
}

class PersonalState extends State<PersonalPage>{

  User _user;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: new Text("我的"),
      ),
    );
  }

  void _initUser(){
    String jsonData = "";
    _user = User.fromJSON(json.decode(jsonData));
  }
}