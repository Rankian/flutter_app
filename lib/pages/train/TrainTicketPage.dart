import 'package:flutter/material.dart';
import 'package:flutter_app/pages/train/CalendarPage.dart';
import 'package:flutter_app/pages/train/TicketPage.dart';
import 'package:common_utils/common_utils.dart';

class TrainTicketPage extends StatefulWidget{
  @override
  TrainTicketState createState() => TrainTicketState();
}

class TrainTicketState extends State<TrainTicketPage>{

  bool _isHighSpeedTrain = false;
  bool _isStudentTicket = false;
  bool _isChangeTrain = false;

  String departureDateShow = DateUtil.formatZHDateTime(DateTime.now().toString(), DateFormat.ZH_MONTH_DAY, ":");
  String departureDate = DateUtil.formatDateTime(DateTime.now().toString(), DateFormat.YEAR_MONTH_DAY, "-",":");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                height: 240,
                decoration: BoxDecoration(image: DecorationImage(image: AssetImage("images/train.jpg"), fit: BoxFit.fitHeight)),
              ),
              Expanded(child: Container(decoration: BoxDecoration(color: Colors.white),))
            ],
          ),
          Positioned(
              top: 205,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(width: MediaQuery.of(context).size.width, child: Card(color: Colors.white, elevation: 1.0, margin: EdgeInsets.all(15.0), child: Column(
                    children: <Widget>[
                      Padding(padding: EdgeInsets.only(left: 30, top: 20, right: 30, bottom: 20),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            GestureDetector(onTap: (){},child: Text("重庆北", style: TextStyle(color: Colors.black, fontSize: 20),),),
                            Icon(Icons.all_inclusive, color: Colors.blue, size: 30),
                            GestureDetector(onTap: (){},child: Text("万州北", style: TextStyle(color: Colors.black, fontSize: 20),),),
                          ],),),
                      Divider(height: 1,),
                      Padding(padding: EdgeInsets.all(20.0), child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text("出发日期", style: TextStyle(color: Colors.grey, fontSize: 12.0),),
                          Padding(padding: EdgeInsets.only(left: 15.0, right: 15.0), child: GestureDetector(
                            onTap: (){
                              Navigator.of(context).push<String>(MaterialPageRoute(builder: (BuildContext context){
                                return CalendarPage();
                              })).then((String result){
                                print("选择日期:$result");
                                setState(() {
                                  departureDateShow = DateUtil.formatZHDateTime(result, DateFormat.ZH_MONTH_DAY, ":");
                                  departureDate = DateUtil.formatDateTime(result, DateFormat.YEAR_MONTH_DAY, "-",":");;
                                });
                              });
                            },
                            child: Text(departureDateShow, style: TextStyle(color: Colors.black, fontSize: 20.0),),
                          ),),
                          Text(_getWeekDay(DateUtil.getDateTime(departureDate)), style: TextStyle(color: Colors.grey, fontSize: 12.0),),
                        ],
                      ),),
                      Divider(height: 1,),
                      Padding(padding: EdgeInsets.only(left: 10, top: 20, right: 10, bottom: 20), child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          GestureDetector(
                            onTap: (){
                              setState(() {
                                _isHighSpeedTrain = !_isHighSpeedTrain;
                              });
                            },
                            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
                              Text("只看高铁/动车", style: TextStyle(color: Colors.grey[700], fontSize: 12.0)),
                              Icon(_isHighSpeedTrain ? Icons.check_box : Icons.check_box_outline_blank, color: _isHighSpeedTrain?  Colors.blue : Colors.grey[400], size: 18,)
                            ],),
                          ),
                          GestureDetector(
                            onTap: (){
                              setState(() {
                                _isStudentTicket = !_isStudentTicket;
                              });
                            },
                            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
                              Text("学生票", style: TextStyle(color: Colors.grey[700], fontSize: 12.0)),
                              Icon(_isStudentTicket ? Icons.check_box : Icons.check_box_outline_blank, color: _isStudentTicket?  Colors.blue : Colors.grey[400], size: 18,)
                            ],),
                          ),
                          GestureDetector(
                            onTap: (){
                              setState(() {
                                _isChangeTrain = !_isChangeTrain;
                              });
                            },
                            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
                              Text("兑换车次", style: TextStyle(color: Colors.grey[700], fontSize: 12.0)),
                              Icon(_isChangeTrain ? Icons.check_box : Icons.check_box_outline_blank, color: _isChangeTrain?  Colors.blue : Colors.grey[400], size: 18,)
                            ],),
                          )
                        ],
                      ),),
                      Row(children: <Widget>[
                        Expanded(child: Container(margin: EdgeInsets.only(left: 10, right: 10), child: RaisedButton(
                            color: Colors.blue,
                            child: Padding(padding: EdgeInsets.all(13.0), child: Text("查询车票",style: TextStyle(color: Colors.white, fontSize: 16.0),),),
                            onPressed: (){
                              Navigator.of(context).push(new MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                  TicketPage(departureDate)));
                            }),))
                      ],),
                      Padding(padding: EdgeInsets.all(10.0), child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text("重庆北--万州北", style: TextStyle(color: Colors.grey[700], fontSize: 12.0),),
                          Text("清除历史", style: TextStyle(color: Colors.blue, fontSize: 12.0),)
                      ],),)
                    ],
                  ),
                  ),)
                ],
              ))
        ],
      ),
    );
  }

  Widget _createCheckBox(String title, bool value){
    return GestureDetector(
      onTap: (){
        setState(() {
          value = !value;
        });
      },
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
        Text(title, style: TextStyle(color: Colors.grey[700], fontSize: 12.0)),
        Icon(value ? Icons.check_box : Icons.check_box_outline_blank, color: value?  Colors.blue : Colors.grey[400], size: 18,)
      ],),
    );
  }

  String _getWeekDay(DateTime time){
    String weekday = "";
    switch(time.weekday){
      case 1:
        weekday = "周一";
        break;
      case 2:
        weekday = "周二";
        break;
      case 3:
        weekday = "周三";
        break;
      case 4:
        weekday = "周四";
        break;
      case 5:
        weekday = "周五";
        break;
      case 6:
        weekday = "周六";
        break;
      case 7:
        weekday = "周日";
        break;
      default:
        break;
    }
    return weekday;
  }
}