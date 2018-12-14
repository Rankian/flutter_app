import 'package:flutter/material.dart';

class TextStudy extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new TextState();
  }
}

class TextState extends State {

 bool isUpload = false;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Center(
          child: new Text("完善信息",
          style:
            new TextStyle(
              fontSize: 18.0
            ),),
        ),
      ),
      body: new ListView(
        children: <Widget>[
          new Container(
            child:
            new Center(
              child: new IconButton(icon: new Icon(Icons.backup), color: isUpload ? Colors.blue : Colors.black, onPressed: _upload)
            ),
          )
        ],
      )
    );
  }

  void _upload(){
    setState(() {
      isUpload = !isUpload;
      print("上传中" + isUpload.toString());
    });
  }
}
