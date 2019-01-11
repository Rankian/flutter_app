import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/pages/LoginPage.dart';
import 'package:flutter_app/pages/SetPage.dart';
import 'package:flutter_app/pages/SplashPage.dart';
import 'package:flutter_app/pages/imprint/PublishImprintPage.dart';
import 'package:flutter_app/pages/map/MapPage.dart';
import 'package:flutter_app/pages/train/TrainTicketPage.dart';
import 'package:flutter_app/ui/HomePage.dart';
import 'package:amap_location/amap_location.dart';

void main() {
  AMapLocationClient.setApiKey("ea21d8327a3b3a9494853615ea0e65c7");
  runApp(new MaterialApp(
    theme: ThemeData(primaryColor: Colors.red, accentColor: Colors.red, primaryColorDark: Colors.red),
    home: new SplashPage(),
    routes: <String, WidgetBuilder>{ // 路由
      'LoginPage': (BuildContext context) => LoginPage(),
      'HomePage': (BuildContext context) => new HomePage(),
      'PublishPage': (BuildContext context) => new PublishImprintPage(),
      'SetPage': (BuildContext context) => new SetPage(),
      'MapPage': (BuildContext context) => new MapPage(),
      'TrainTicketPage': (BuildContext context) => new TrainTicketPage(),
    },
  ));
  if (Platform.isAndroid) {
    SystemUiOverlayStyle overlayStyle =
        SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(overlayStyle);
  }
}
