import 'package:flutter/material.dart';
import 'package:flutter_app/model/User.dart';
import 'dart:convert';
import 'dart:io';
import 'package:fluttertoast/fluttertoast.dart';

class PersonalPage extends StatefulWidget {
  @override
  PersonalState createState() => PersonalState();
}

class PersonalState extends State<PersonalPage>
    with AutomaticKeepAliveClientMixin {
  User _user;

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
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
                          child: Row(
                            children: <Widget>[
                              ClipOval(
                                child: SizedBox(
                                  width: 80,
                                  height: 80,
                                  child: Image.asset("images/avatar.jpg"),
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
                                      child: Text("Libra",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18.0,
                                              fontWeight: FontWeight.bold)),
                                    ),
                                    Container(
                                      child: Text("感谢你曾经来过  就算是你个过客",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12.0)),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        child: IconButton(
                            icon: Icon(Icons.settings, color: Colors.white),
                            onPressed: () {
                              _showToast("设置个鬼啊");
                            }),
                        top: 26,
                        right: 10,
                      ),
                    ],
                  ),
                  Expanded(
                      child: Container(
                    decoration: BoxDecoration(color: Colors.grey[200]),
                    child: Container(
                      margin: const EdgeInsets.only(
                          top: 20.0, left: 20.0, right: 20.0, bottom: 42.0),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(8.0))),
                      child: Center(
                        child: Column(
                          children: <Widget>[
                            buildMenu("火车票", (){
                              Navigator.of(context).pushNamed("TrainTicketPage");
                            }),
                            Divider(height: 1,)
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

  void _initUser() {
    String jsonData = "";
    _user = User.fromJSON(json.decode(jsonData));
  }

  void _showToast(String msg) {
    Fluttertoast.showToast(
      msg: msg,
      textColor: Colors.white,
      gravity: ToastGravity.BOTTOM,
    );
  }

  Widget buildMenu(String menu, GestureTapCallback callBack){
    return GestureDetector(
      onTap: callBack,
      child: Padding(
        padding: EdgeInsets.only(left: 15.0, top: 20.0, right: 15.0, bottom: 20.0),
        child: Row(
          mainAxisAlignment:
          MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              menu,
              style: TextStyle(
                  color: Colors.black, fontSize: 16.0),
            ),
            Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 18,)
          ],
        ),
      ),
    );
  }
}
