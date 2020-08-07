import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:common_utils/common_utils.dart';

class CalendarPage extends StatefulWidget {
  @override
  CalendarState createState() => CalendarState();
}

class CalendarState extends State<CalendarPage>{

  DateTime _currentDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.blue,
        leading: GestureDetector(child: Icon(Icons.arrow_back_ios),onTap: (){Navigator.of(context).pop();},),
        title: Text(
          "选择日期",
          style: TextStyle(color: Colors.white, fontSize: 20.0),
        ),
        centerTitle: true,
        actions: <Widget>[
          GestureDetector(child: Center(child: Padding(padding: EdgeInsets.only(right: 15), child: Text("确定", style: TextStyle(color: Colors.white, fontSize: 18.0),),),),
          onTap: (){
            int time = DateUtil.getDateMsByTimeStr(DateUtil.formatDateStr(_currentDate.toString()));
            int today = DateUtil.getDateMsByTimeStr(DateUtil.formatDateStr(DateTime.now().toString()));
            if(time < today){
              _showToast("请选择今天或以后的日期");
            }else if(time - today > 28 * 24 * 60 * 60 * 1000){
              _showToast("请选择预售期以内的日期");
            }else{
              Navigator.of(context).pop(_currentDate.toString());
            }
          },)
        ],
      ),
      body: Container(
        child: CalendarCarousel(
          onDayPressed: (DateTime date, List<Event> events) {
            this.setState(() => _currentDate = date);
          },
          weekendTextStyle: TextStyle(
            color: Colors.red,
          ),
          thisMonthDayBorderColor: Colors.grey,
          weekFormat: false,
          locale: "Zh",
          height: 420.0,
          selectedDateTime: _currentDate,
          customGridViewPhysics: NeverScrollableScrollPhysics(),
        ),
      ),
    );
  }

  void _showToast(String msg) {
  }
  
}