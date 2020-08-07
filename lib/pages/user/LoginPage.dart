import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/base/BasePage.dart';
import 'package:flutter_app/utils/ACache.dart';
import 'package:flutter_app/utils/DioUtils.dart';
import 'dart:convert';
import 'package:convert/convert.dart';
import 'package:crypto/crypto.dart';

class LoginPage extends StatefulWidget {
  @override
  LoginState createState() => new LoginState();
}

class LoginState extends BaseState<LoginPage> {

  static final TextEditingController _usernameController = new TextEditingController();
  static final TextEditingController _passwordController = new TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        body: Stack(children: <Widget>[
        Container(
          decoration: BoxDecoration(color: Color(0xff1AC8EE)),
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
                margin: EdgeInsets.only(top: 120, left: 15.0, right: 15.0),
                padding: EdgeInsets.all(20.0),
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(10.0))),
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Image.asset("images/logo.png", width: 100, height: 100,),
                      Container(
                        margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(22.0)),),
                        padding: EdgeInsets.all(12.0),
                        child: Row(
                          children: <Widget>[
                            Icon(Icons.phone_android, color: Colors.black,),
                            Padding(padding: EdgeInsets.only(left: 10)),
                            Expanded(child: TextFormField(
                                keyboardType: TextInputType.phone,
                                inputFormatters: [LengthLimitingTextInputFormatter(11)],
                                decoration: InputDecoration.collapsed(
                                    hintText: "请输入手机号码",
                                    hintStyle: TextStyle(
                                        color: Colors.black, fontSize: 14.0),),
                                controller: _usernameController,
                              ),
                            )
                          ],
                        )
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 15, left: 20, right: 20),
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
                                      color: Colors.black, fontSize: 14.0),),
                              controller: _passwordController,
                            ),)
                          ],
                        )
                      ),
                      Container(margin: EdgeInsets.only(top: 20, left: 30, right: 30),
                      height: 46,
                      child: RaisedButton(onPressed: (){
                        String phone = _usernameController.text;
                        String password = _passwordController.text;
                        if(_verify(phone, _passwordController.text)){
                          login(phone, password);
                          showLoadingDialog();
                        }
                      }, child: Center(child: Text("登  录", style: TextStyle(color: Colors.white, fontSize: 16.0),),),
                      color: Color(0xff1AC8EE)))
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    ));
  }

  Future login(String username, String password) async {
    Response response = await DioUtils.get().get("/1/login", queryParameters: {'username': username, 'password': hex.encode(md5.convert(Utf8Encoder().convert(password)).bytes)});
    if(response.statusCode == 200){
        ACache.saveString("user", jsonEncode(response.data)).then((success){
          print("保存：$success");
        });
        hideLoadingDialog();
        Navigator.of(context).pushReplacementNamed("HomePage");
    }else{
      hideLoadingDialog();
      showToast("用户名或密码错误");
    }
  }

  bool _verify(String username, String password){
    if(username.isEmpty || username.length != 11){
      showToast("请输入正确的手机号码");
      return false;
    }
    if(password.isEmpty){
      showToast("请输入密码");
      return false;
    }
    return true;
  }


}
