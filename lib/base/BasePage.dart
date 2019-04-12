import 'package:flutter/material.dart';
import 'package:flutter_app/view/LoadingDialog.dart';
import 'package:flutter_app/view/Toast.dart';

class BaseState<T extends StatefulWidget> extends State<T>{

  bool _loadingDialogIsShowing = false;

  @override
  Widget build(BuildContext context) {
    return null;
  }

  void showLoadingDialog(){
    showDialog(context: context, builder: (c){
      _loadingDialogIsShowing = true;
      return LoadingDialog(text: "正在登录...",);
    });
  }

  void hideLoadingDialog(){
    if(_loadingDialogIsShowing) {
      Navigator.of(context).pop();
      _loadingDialogIsShowing = false;
    }
  }

  void toPage(String routeName){
    Navigator.of(context).pushNamed(routeName);
  }

  void showToast(message, {int duration = 1,
    int gravity = 0,
    Color backgroundColor = const Color(0xCC000000),
    Color textColor = Colors.white,
    double backgroundRadius = 10}){
      Toast.show(message, context, duration: duration, gravity: gravity, backgroundColor: backgroundColor,
      textColor: textColor, backgroundRadius: backgroundRadius);
  }

  Widget appBar({String title, Color backgroundColor}){
    return AppBar(leading: GestureDetector(
      child: Icon(Icons.arrow_back_ios),
      onTap: () {
        Navigator.of(context).pop();
      },
    ),
      title: Text(
        title,
        style: TextStyle(color: Colors.white, fontSize: 18.0),
      ),
      centerTitle: true,
      elevation: 0,
      backgroundColor: Colors.pinkAccent);
  }
}