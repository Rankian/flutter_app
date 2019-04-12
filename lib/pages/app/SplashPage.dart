import 'package:flutter/material.dart';
import 'package:common_utils/common_utils.dart';

class SplashPage extends StatefulWidget {
  @override
  SplashState createState() => SplashState();
}

class SplashState extends State<SplashPage> {

  int times = 3;
  bool _isLogin = true;

  @override
  void initState() {
    super.initState();
    countDown();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Stack(
        children: <Widget>[
          new Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("images/splash.jpg"), fit: BoxFit.fill)),
          ),
          new Positioned(top: 36.0, right: 15.0, child: new Container(
            width: 60,
            height: 30,
            decoration: new BoxDecoration(color: Color(0x4DFFFFFF), borderRadius: BorderRadius.all(Radius.circular(3.0))),
            child: Container(child: Center(child: new Text(times.toString() + "s", style: TextStyle(fontSize: 14.0, color: Colors.white),),),),
          ))
        ],
      ),
    );
  }

  void countDown(){
    TimerUtil timerUtil = new TimerUtil(mInterval: 1000, mTotalTime: 3000);
    timerUtil.setOnTimerTickCallback((int value){
      setState(() {
        times = value ~/ 1000;
      });
      if(times == 0){
        Navigator.of(context).pushReplacementNamed(_isLogin ? 'HomePage' : 'LoginPage');
        timerUtil.cancel();
      }
    });
    timerUtil.startCountDown();
  }
}
