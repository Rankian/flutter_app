import 'package:flutter/material.dart';

class FeedBackPage extends StatefulWidget {
  @override
  FeedBackState createState() => FeedBackState();
}

class FeedBackState extends State<FeedBackPage> {
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
          "意见反馈",
          style: TextStyle(color: Colors.white, fontSize: 18.0),
        ),
        centerTitle: true,
        backgroundColor: Colors.orange[300],
      ),
      backgroundColor: Colors.grey[200],
      body: Column(crossAxisAlignment: CrossAxisAlignment.center,children: <Widget>[
        Container(
          decoration: BoxDecoration(color: Colors.white),
          padding: const EdgeInsets.all(10.0),
          alignment: Alignment.topLeft,
          height: 220,
          child: TextFormField(
            maxLines: 10,
            keyboardType: TextInputType.text,
            decoration: InputDecoration.collapsed(
                hintText: "请把你宝贵的意见给我们",
                hintStyle: TextStyle(color: Colors.grey[350], fontSize: 14.0)),
          ),),
          Container(margin: EdgeInsets.only(top: 30, left: 30, right: 30),
            height: 48,
            child: RaisedButton(onPressed: (){
            }, child: Center(child: Text("提\u3000\u3000交", style: TextStyle(color: Colors.white, fontSize: 16.0),),),
                color: Colors.orange[300]))
      ],),
    );
  }
}