import 'package:flutter/material.dart';
import 'package:flutter_app/base/BasePage.dart';
import 'package:flutter/animation.dart';

class AnimPage extends StatefulWidget {
  @override
  AnimState createState() => AnimState();
}

class AnimState extends BaseState<AnimPage> with SingleTickerProviderStateMixin {

  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(duration: const Duration(seconds: 5), vsync: this);
    animation = Tween(begin: 0.0, end: 200.0).animate(controller)
                ..addListener((){
                  setState(() {

                  });
    });
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(title: "动画"),
      body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints viewportConstraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(constraints: BoxConstraints(minHeight: viewportConstraints.maxHeight),
            child: IntrinsicHeight(
              child: Column(
                children: <Widget>[
                  _titleWidget("Tween动画"),
                  _tweenAnimWidget()
                ],
              ),
            ),
          ),
        );
      }),
    );
  }

  Widget _titleWidget(String title){
    return Padding(padding: EdgeInsets.all(10.0), child: Text(title, style: TextStyle(color: Colors.black, fontSize: 16.0),),);
  }

  Widget _tweenAnimWidget(){
    return Container(margin: EdgeInsets.all(10.0),
      height: animation.value,
      width: animation.value,
      child: Image.asset("images/logo.png", width: 100, height: 100,),
    );
  }

  void _type(){
    String type = 'hello';
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
