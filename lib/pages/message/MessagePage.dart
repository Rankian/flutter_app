import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/model/message/MessageInfo.dart';
import 'package:flutter_app/utils/DioUtils.dart';
import 'package:flutter_app/view/LoadingDialog.dart';
import 'package:flutter_app/view/MBehavior.dart';
import 'package:flutter_app/view/SwipeWidget.dart';

class MessagePage extends StatefulWidget {
  @override
  MessageState createState() => MessageState();
}

class MessageState extends State<MessagePage> {
  MessageInfo _messageInfo;

  @override
  void initState() {
    super.initState();
    _request();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            child: Icon(Icons.arrow_back_ios),
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
          title: Text(
            "消息",
            style: TextStyle(color: Colors.white, fontSize: 18.0),
          ),
          centerTitle: true,
          backgroundColor: Colors.cyan,
        ),
        body: _buildFuture());
  }

  Widget _buildFuture() {
    if (_messageInfo == null) {
      return LoadingDialog(text: "加载中");
    } else {
      return ScrollConfiguration(
          behavior: MBehavior(),
          child: ListView.builder(
              itemCount: _messageInfo.results.length,
              itemBuilder: (BuildContext context, int index) {
                return _msgItem(context, index);
              }));
    }
  }

  Widget _msgItem(BuildContext context, int index) {
    var msg = _messageInfo.results[index];
    return SwipeWidget(
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(10.0, 8.0, 10.0, 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ClipOval(
                  child: SizedBox(
                    width: 50.0,
                    height: 50.0,
                    child: Image.network(msg.senderAvatar),
                  ),
                ),
                Padding(padding: EdgeInsets.fromLTRB(8.0, 0, 8.0, 0)),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      msg.senderName,
                      style: TextStyle(color: Colors.black, fontSize: 14.0),
                    ),
                    Padding(padding: EdgeInsets.fromLTRB(0, 5.0, 0, 5.0)),
                    Text(
                      msg.content,
                      style: TextStyle(color: Colors.grey, fontSize: 12.0),
                    ),
                  ],
                )),
                Container(
                  width: 40.0,
                  child: Column(
                    children: <Widget>[
                      Text(
                        msg.senderTime,
                        style: TextStyle(color: Colors.grey, fontSize: 12.0),
                      ),
                      Offstage(
                        offstage: msg.isNew == 0,
                        child: Text(
                          "·",
                          style:
                              TextStyle(color: Colors.red[400], fontSize: 30.0),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Divider(
            height: 1,
          )
        ],
      ),
      button: "删除",
      buttonColor: Colors.redAccent,
      onButtonPressed: () {
      },
      onTap: () {
      },
    );
  }

  Future _request() async {
    Response response = await DioUtils.get().get("/1/classes/Message");
    setState(() {
      _messageInfo = MessageInfo.fromJson(response.data);
    });
  }
}
