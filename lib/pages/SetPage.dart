import 'package:flutter/material.dart';

class SetPage extends StatefulWidget {
  @override
  SetState createState() => SetState();
}

class SetState extends State<SetPage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "设置",
          style: TextStyle(color: Colors.white, fontSize: 18.0),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Text("最新电影", style: TextStyle(color: Colors.black, fontSize: 14.0),),
            Container(
              height: 140,
              child: ListView.builder(
                itemCount: 100,
                itemBuilder: (BuildContext context, int index) => Container(
                  decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(5.0))),
                  child: Center(
                    child: Text("$index"),
                  ),
                ),
                scrollDirection: Axis.horizontal,),
            )
          ],
        ),
      ),
    );
  }
}