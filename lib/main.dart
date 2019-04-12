import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/anim/AnimPage.dart';
import 'package:flutter_app/pages/app/FeedBackPage.dart';
import 'package:flutter_app/pages/user/LoginPage.dart';
import 'package:flutter_app/pages/app/SplashPage.dart';
import 'package:flutter_app/pages/imprint/PublishImprintPage.dart';
import 'package:flutter_app/pages/map/MapPage.dart';
import 'package:flutter_app/pages/train/TrainTicketPage.dart';
import 'package:flutter_app/pages/user/UserInfoPage.dart';
import 'package:flutter_app/ui/HomePage.dart';
import 'package:amap_location/amap_location.dart';

void main() {
  AMapLocationClient.setApiKey("ea21d8327a3b3a9494853615ea0e65c7");
  runApp(new MaterialApp(
    theme: ThemeData(primaryColor: Colors.red, accentColor: Colors.red, primaryColorDark: Colors.red),
    home: new SplashPage(),
    routes: <String, WidgetBuilder>{ // 路由
      'LoginPage': (BuildContext context) => LoginPage(),
      'HomePage': (BuildContext context) => HomePage(),
      'PublishPage': (BuildContext context) => PublishImprintPage(),
      'MapPage': (BuildContext context) => MapPage(),
      'TrainTicketPage': (BuildContext context) => TrainTicketPage(),
      'UserInfoPage': (BuildContext context) => UserInfoPage(),
      'FeedBackPage': (BuildContext context) => FeedBackPage(),
      'AnimPage': (BuildContext context) => AnimPage(),
    },
    debugShowCheckedModeBanner: false,
  ));
  if (Platform.isAndroid) {
    SystemUiOverlayStyle overlayStyle =
        SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(overlayStyle);
  }
}
