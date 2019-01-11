import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/model/User.dart';
import 'package:flutter_app/view/EnsureVisibleWhenFocused.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginPage extends StatefulWidget {
  @override
  LoginState createState() => new LoginState();
}

class LoginState extends State<LoginPage> {

  FocusNode _focusNodeUserName = new FocusNode();
  static final TextEditingController _passwordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(color: Colors.blue),
        ),
        Container(
          padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      print("注册暂未开通");
                    },
                    child: Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Text(
                        "注册",
                        style: TextStyle(color: Colors.white, fontSize: 16.0),
                      ),
                    ),
                  )
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 120,),
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(top: 100, left: 30, right: 30),
                        decoration: BoxDecoration(
                          color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(22.0)),),
                        padding: EdgeInsets.all(12.0),
                        child: Row(
                          children: <Widget>[
                            Icon(Icons.phone_android, color: Colors.black,),
                            Padding(padding: EdgeInsets.only(left: 10)),
                            Expanded(child: EnsureVisibleWhenFocused(
                              focusNode: _focusNodeUserName,
                              child: TextFormField(
                                keyboardType: TextInputType.phone,
                                inputFormatters: [LengthLimitingTextInputFormatter(11)],
                                decoration: InputDecoration.collapsed(
                                    hintText: "请输入手机号码",
                                    hintStyle: TextStyle(
                                        color: Colors.black, fontSize: 14.0),),
                                onSaved: (String value){

                                },
                                controller: _passwordController,
                                focusNode: _focusNodeUserName,
                              ),
                            ),)
                          ],
                        )
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 15, left: 30, right: 30),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                          BorderRadius.all(Radius.circular(22.0)),),
                        padding: EdgeInsets.all(12.0),
                        child: Row(
                          children: <Widget>[
                            Icon(Icons.lock, color: Colors.black,),
                            Padding(padding: EdgeInsets.only(left: 10)),
                            Expanded(child: TextFormField(
                              keyboardType: TextInputType.text,
                              inputFormatters: [LengthLimitingTextInputFormatter(16)],
                              obscureText: true,
                              decoration: InputDecoration.collapsed(
                                  hintText: "请输入密码",
                                  hintStyle: TextStyle(
                                      color: Colors.black, fontSize: 14.0)),
                            ),)
                          ],
                        )
                      ),
                      Container(margin: EdgeInsets.only(top: 20, left: 30, right: 30),
                      child: RaisedButton(onPressed: (){
                        Navigator.of(context).pushReplacementNamed('HomePage');
                      }, child: Center(child: Text("登录", style: TextStyle(color: Colors.white, fontSize: 14.0),),),))
                    ],
                  ),
                ),
              )
            ],
          ),
        )
      ],
    ));
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
