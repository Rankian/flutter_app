import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/model/Imprint/Imprint.dart';
import 'package:flutter_app/utils/DioUtils.dart';

class PublishImprintPage extends StatefulWidget {
  @override
  PublishState createState() => PublishState();
}

class PublishState extends State<PublishImprintPage> {

  File selectPicFile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "印记",
          style: TextStyle(color: Colors.white, fontSize: 18.0),
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.backup,
                color: Colors.white,
                size: 24,
              ),
              onPressed: uploadCommit),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(10.0),
              alignment: Alignment.topLeft,
              height: 220,
              child: TextFormField(
                maxLines: 10,
                keyboardType: TextInputType.text,
                decoration: InputDecoration.collapsed(
                    hintText: "这趟旅程，有什么有趣的事儿吗？",
                    hintStyle:
                    TextStyle(color: Colors.grey[350], fontSize: 14.0)),
              ),
            ),
            Row(
              children: <Widget>[
                Offstage(
                  offstage: selectPicFile == null,
                  child: GestureDetector(
                    child: Container(
                      width: 80,
                      height: 80,
                      margin: const EdgeInsets.only(left: 10.0, top: 10.0, bottom: 10.0),
                      child: Image.file(selectPicFile == null ? File("") : selectPicFile, fit: BoxFit.fitWidth,),),
                    onTap: () {
                      print("添加图片");
                    },
                  ),
                ),
                GestureDetector(
                  child: Container(
                    margin: const EdgeInsets.all(10.0),
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        border: Border.all(color: Colors.grey, width: 0.8)
                    ),
                    child: Center(child: Icon(Icons.add, size: 40, color: Colors.grey,),),
                  ),
                  onTap: () {
                    getImage();
                  },
                )
              ],
            )
          ],
        ),
      )
    );
  }

  Future uploadCommit() async {
    Imprint imprint = Imprint(0, 1, "data:image/jpeg;base64,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",
        "2018.12.25", "穿着拖鞋T足球", "奥体中心",
        "http://tu.587kan.com/c171102/1509553032440-15S95.jpg");
    Response response = await DioUtils.get().post("/1/classes/Imprint", data: imprint.toJson());
    print("请求结果:" + response.statusCode.toString() + "," + jsonEncode(response.data));
    if(response.statusCode == 201)
      Navigator.of(context).pop();
  }

  Future getImage() async {
//    var image = await ImagePicker.pickImage(source: ImageSource.gallery, maxHeight: 80, maxWidth: 80);
//    setState(() {
//      selectPicFile = image;
//    });
  }
}
