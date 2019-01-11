import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/model/train/Ticket.dart';
import 'package:flutter_app/model/train/TrainTicket.dart';

class TicketPage extends StatefulWidget {
  String departureDate;

  TicketPage(this.departureDate);

  @override
  TicketState createState() => TicketState(departureDate);
}

class TicketState extends State<TicketPage> {

  List<Ticket> _ticketList;

  String departureDate;
  TicketState(this.departureDate);

  @override
  void initState() {
    super.initState();
    _ticketList = List();
    _requestTicket(departureDate);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      elevation: 0,
      backgroundColor: Colors.blue,
      leading: GestureDetector(child: Icon(Icons.arrow_back_ios),onTap: (){Navigator.of(context).pop();},),
      title: Text(
        "重庆北 <> 万州北",
        style: TextStyle(color: Colors.white, fontSize: 20.0),
      ),
      centerTitle: true,
      actions: <Widget>[Padding(padding: EdgeInsets.only(right: 15.0), child: Icon(Icons.more_horiz, color: Colors.white, size: 24,),)],
    ),
      body: Column(
        children: <Widget>[
          Container(width: MediaQuery.of(context).size.width, height: 40, decoration: BoxDecoration(color: Colors.blue),child: Padding(
              padding: EdgeInsets.only(left: 15.0, right: 15.0),child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text("前一天", style: TextStyle(color: Colors.white, fontSize: 16.0),),
              Container(width: 160, height: 30,
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(3.0))),child:Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                    Padding(padding: EdgeInsets.only(right: 10.0), child: Text("1月3日 周四", style: TextStyle(color: Colors.blue, fontSize: 16.0),),),
                    Icon(Icons.calendar_today, color: Colors.blue, size: 20,)
                  ],),),
              Text("后一天", style: TextStyle(color: Colors.white, fontSize: 16.0),)
            ],
          ),)),
          Expanded(child: ListView.builder(
              itemCount: _ticketList.length,
              itemBuilder: (context, i) {
                Ticket t = _ticketList[i];
                return Container(
                  child: Column(children: <Widget>[
                    Container(padding: EdgeInsets.all(15.0), decoration: BoxDecoration(color: Colors.white),child: Row(children: <Widget>[
                      Container(width: 60 ,margin: EdgeInsets.only(right: 15.0),child: Text(t.trainNum, style: TextStyle(color: Colors.black, fontSize: 20.0),),),
                      Expanded(child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Column(children: <Widget>[
                            Row(children: <Widget>[
                              Container(width: 14, height: 14, decoration: BoxDecoration(border: Border.all(color: Colors.grey[350], width: 0.8)),child: Center(
                                child: Text(t.trainType == 1 ? "始" : "过", style: TextStyle(color: Colors.green[700], fontSize: 8.0),),
                              ),),
                              Padding(padding: EdgeInsets.only(left: 5.0, right: 5.0), child:
                                Text(t.departStationName, style: TextStyle(color: Colors.black, fontSize: 15.0),),)
                            ],),
                            Text(t.departDepartTime, style: TextStyle(color: Colors.blue, fontSize: 13.0),)
                          ],),
                          Column(children: <Widget>[
                            Image.asset("images/id_card.png", scale: 2,),
                            Text(t.durationStr, style: TextStyle(color: Colors.grey[400], fontSize: 11.0),)
                          ],),
                          Column(children: <Widget>[
                            Row(children: <Widget>[
                              Container(width: 14, height: 14, decoration: BoxDecoration(border: Border.all(color: Colors.grey[350], width: 0.8)),child: Center(
                                child: Text(t.trainType == 5 ? "过" : "终", style: TextStyle(color: Colors.blue, fontSize: 8.0),),
                              ),),
                              Padding(padding: EdgeInsets.only(left: 5.0, right: 5.0), child:
                              Text(t.destStationName, style: TextStyle(color: Colors.black, fontSize: 15.0),),)
                            ],),
                            Text(t.destArriveTime, style: TextStyle(color: Colors.blue, fontSize: 13.0),)
                          ],),
                        ],))
                    ],),),

//                    Container(height: 40,padding: EdgeInsets.all(1.0), decoration: BoxDecoration(color: Colors.grey[200]), child:
//                      GridView.builder(
//                          padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
//                          physics: NeverScrollableScrollPhysics(),
//                          itemCount: t.prices.length,
//                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3
//                          ),
//                          itemBuilder: (context, index){
//                            bool status = t.prices[index].seatStatus == "有";
//                            return Container(height: 60, child: Row(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center, children: <Widget>[
//                              Text(t.prices[index].seatName.substring(0, 2) + "：", style: TextStyle(color: Colors.grey[900], fontSize: 13.0),),
//                              Text(status ? t.prices[index].seatStatus : t.prices[index].leftNumber.toString(), style: TextStyle(color: status ? Colors.green : Colors.grey[900], fontSize: 13.0),),
//                            ],),);
//                          }),)
                  ],),
                );
              }))
        ],
      ),
    );
  }

  Future _requestTicket(String time) async{
    Dio dio = new Dio();
    Response response = await dio
        .get("http://huoche.tuniu.com/yii.php?r=train/trainTicket/getTickets&primary%5BdepartureDate%5D=$time&primary%5BdepartureCityCode%5D=300&primary%5BdepartureCityName%5D=重庆&primary%5BarrivalCityCode%5D=302&primary%5BarrivalCityName%5D=万州&start=0&limit=0");
    TrainTicket trainTicket = TrainTicket.fromJson(json.decode(response.data));
    setState(() {
      _ticketList.clear();
      _ticketList.addAll(trainTicket.list);
    });
  }
}
