import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_app/base/BasePage.dart';
import 'package:flutter_app/model/User.dart';
import 'package:flutter_app/pages/message/MessagePage.dart';
import 'package:flutter_app/utils/ACache.dart';
import 'dart:convert';
import 'package:path_provider/path_provider.dart';

import 'package:flutter_app/utils/DioUtils.dart';

class PersonalPage extends StatefulWidget {
  @override
  PersonalState createState() => PersonalState();
}

class PersonalState extends BaseState<PersonalPage>
    with AutomaticKeepAliveClientMixin {
  User _user;

  var _shareIcons = ["images/share_wechat.png", "images/share_circle.png", "images/share_qq.png", "images/share_qq_circle.png",
                    "images/share_alipay.png", "images/share_sina.png",];
  var _shareStr = ["微信好友", "朋友圈", "QQ好友", "QQ空间", "支付宝好友", "微博"];

  @override
  bool get wantKeepAlive => true;
  
  @override
  void initState() {
    super.initState();
    ACache.getString("user").then((json){
      setState(() {
        _user = User.fromJSON(jsonDecode(json));
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints viewportConstraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints:
                BoxConstraints(minHeight: viewportConstraints.maxHeight),
            child: IntrinsicHeight(
              child: Column(
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.all(20.0),
                        decoration: BoxDecoration(color: Colors.red[900]),
                        height: 210,
                        child: Center(
                          child: GestureDetector(
                            onTap: (){
                              if(_user == null){
                                Navigator.of(context).pushReplacementNamed('LoginPage');
                              }
                            },
                            child: Row(
                              children: <Widget>[
                                ClipOval(
                                  child: SizedBox(
                                    width: 80,
                                    height: 80,
                                    child: _user == null ? Image.asset("images/default_avatar.png") : Image.network(_user.avatar),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 30.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Container(
                                        padding: EdgeInsets.only(bottom: 15.0),
                                        child: Text(_user == null ? "登录/注册" : _user.nickname,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18.0,
                                                fontWeight: FontWeight.bold)),
                                      ),
                                      Offstage(
                                        offstage: _user == null,
                                        child: Container(
                                          child: Text("感谢你曾经来过  就算是你个过客",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 12.0)),
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          )
                        ),
                      ),
                      Positioned(
                        child: IconButton(
                            icon: Icon(Icons.settings, color: Colors.white),
                            onPressed: () {
                              Navigator.of(context).pushNamed('UserInfoPage');
                            }),
                        top: 26,
                        right: 10,
                      ),
                    ],
                  ),
                  Expanded(child: Container(
                    decoration: BoxDecoration(color: Colors.grey[200]),
                    child: Container(margin: const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0, bottom: 42.0),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(8.0))),
                      child: Center(
                        child: Column(
                          children: <Widget>[
                            buildMenu(0xe638, Colors.blue, "12306", (){
                              Navigator.of(context).pushNamed("TrainTicketPage");
                            }),
                            Divider(height: 1,),
                            buildMenu(0xe619, Colors.red[300], "消息中心", (){
                              Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
                                return MessagePage();
                              }));
                            }),
                            Divider(height: 1,),
                            buildMenu(0xe603, Colors.orangeAccent, "绑定手机", (){

                            }),
                            Divider(height: 1,),
                            buildMenu(0xe6b1, Colors.red, "安全中心", (){
                              showToast("安全中心");
                            }),
                            Divider(height: 1,),
                            buildMenu(0xe7ff, Colors.purple[300], "意见反馈", (){
                              Navigator.of(context).pushNamed("FeedBackPage");
                            }),
                            Divider(height: 1,),
                            buildMenu(0xe637, Colors.teal, "关于我们", () async {
                              Directory tempDir = await getExternalStorageDirectory();
                              String tempPath = tempDir.path;
                              print("savePath:$tempPath");
                              var saveFile = File('$tempPath/changan.apk');
                              saveFile.createSync();
                              DioUtils.download('https://imtt.dd.qq.com/16891/1480378AD0592D3FD11195D4E6A8FC8F.apk?fsname=com.ccclubs.changan_4.2.0_420.apk&csr=1bbd', "$tempPath/changan.apk");
                            }),
                            Divider(height: 1,),
                            buildMenu(0xe637, Colors.teal, "动画", (){
                              toPage("AnimPage");
                            }),
                            Divider(height: 1,),
                            buildMenu(0xe615, Colors.deepOrange[600], "推荐好友", (){
                                showModalBottomSheet(context: context, builder: (BuildContext context){
                                  return _shareWidget();
                                });
                            }),
                            Divider(height: 1,),
                            Offstage(
                              offstage: _user == null,
                              child: buildMenu(0xe659, Colors.yellow[300], "退出登录", (){
                                _loginOut();
                              }),
                            )
                          ],
                        ),
                      ),
                    ),
                  ))
                ],
              ),
            ),
          ),
        );
      }),
    );
  }

  Widget buildMenu(int codePoint, Color iconColor, String menu, GestureTapCallback callBack){
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: callBack,
      child: Padding(
        padding: EdgeInsets.only(left: 15.0, top: 20.0, right: 15.0, bottom: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(crossAxisAlignment: CrossAxisAlignment.center, children: <Widget>[
              Icon(IconData(codePoint, fontFamily: 'IconFont'),color: iconColor, size: 24.0),
              Padding(padding: EdgeInsets.only(left: 15.0), child: Text(
                menu,
                style: TextStyle(
                    color: Colors.black, fontSize: 16.0),
              ),),
            ],),
            Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 18,)
          ],
        ),
      ),
    );
  }

  Widget _shareWidget(){
    return Container(
      height: 240,
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(12.0),
            height: 180,
            child: Column(
              children: <Widget>[
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                  _shareItem(0, (){}),
                  _shareItem(1, (){}),
                  _shareItem(2, (){}),
                ],),
                Padding(padding: EdgeInsets.fromLTRB(0, 10.0, 0, 10.0)),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    _shareItem(3, (){}),
                    _shareItem(4, (){}),
                    _shareItem(5, (){}),
                  ],),
              ],
            ),
          ),
          Divider(height: 1.0),
        ],
      ),
    );
  }

  Widget _shareItem(int index, GestureTapCallback callback){
    return GestureDetector(child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image.asset(_shareIcons[index], width: 30, height: 30,),
        Padding(padding: EdgeInsets.fromLTRB(0, 5.0, 0, 5.0)),
        Text(_shareStr[index], style: TextStyle(color: Colors.black, fontSize: 14.0),)
      ],
    ), onTap: callback,);
  }

  void _loginOut(){
    ACache.loginOut().then((success){
      if(success) setState(() {
        _user = null;
      });
    });
  }
}
