import 'package:flutter/material.dart';
import 'package:flutter_app/model/User.dart';
import 'package:flutter_app/ui/HomePage.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginPage extends StatefulWidget {
  @override
  LoginState createState() => new LoginState();
}

class LoginState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.blue,
      body: new Container(
          margin: EdgeInsets.fromLTRB(0, 100, 0, 50),
          child: new Center(
            child: new Column(
              children: <Widget>[
                new Image.asset(
                  "images/logo.png",
                  width: 120,
                  height: 120,
                ),
                new Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: new TextField(
                    style: new TextStyle(color: Colors.white, fontSize: 16.0),
                    decoration: new InputDecoration(hintText: "请输入用户名"),
                    obscureText: true,
                  ),
                ),
                //按钮
                new Container(
                  width: 360.0,
                  margin: const EdgeInsets.all(20.0),
                  padding: const EdgeInsets.all(20.0),
                  child: new Card(
                    color: Colors.orange,
                    elevation: 6.0,
                    child: new FlatButton(
                        onPressed: () {
                          Navigator.of(context).pushAndRemoveUntil(
                              new MaterialPageRoute(
                                  builder: (context) => new HomePage()),
                              (route) => route == null);
                        },
                        child: new Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: new Text(
                            "立即登录",
                            style: new TextStyle(
                                color: Colors.white, fontSize: 16.0),
                          ),
                        )),
                  ),
                )
              ],
            ),
          )),
    );
  }

  void _showToast(String msg) {
    Fluttertoast.showToast(
      msg: msg,
      backgroundColor: Colors.black,
      textColor: Colors.white,
      gravity: ToastGravity.BOTTOM,
    );
  }
  User _login() {
    return new User("", 1, 25, "", "");
  }
}
