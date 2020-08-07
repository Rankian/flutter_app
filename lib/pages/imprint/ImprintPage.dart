import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/model/Imprint/ImprintInfo.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class ImprintPage extends StatefulWidget {
  @override
  ImprintState createState() => ImprintState();
}

class ImprintState extends State<ImprintPage> with AutomaticKeepAliveClientMixin {
  Dio dio;
  ImprintInfo _imprintInfo;

  @override
  void initState() {
    super.initState();
    _initDio();
    _request();
  }


  @override
  bool get wantKeepAlive => true;

  void _initDio() {
    BaseOptions options = new BaseOptions();
    options.baseUrl = "https://api2.bmob.cn";
    options.connectTimeout = 5000;
    options.receiveTimeout = 5000;

    Map<String, dynamic> header = new Map();
    header["X-Bmob-Application-Id"] = "6f6fa7d55c805137aa0b2a937c13ae77";
    header["X-Bmob-REST-API-Key"] = "c891efaeb691c3a40426d8b2b408da47";
    header["Content-Type"] = "application/json";
    options.headers = header;

    dio = new Dio(options);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return new Scaffold(
      body: Column(
        children: <Widget>[
          //header
          Container(
            height: 80,
            decoration: BoxDecoration(color: Colors.green),
            child: Stack(
              children: <Widget>[
                Positioned(
                    bottom: 2.0,
                    right: 15.0,
                    child: IconButton(
                        icon: Icon(
                          Icons.camera_alt,
                          color: Colors.white,
                          size: 28.0,
                        ),
                        onPressed: () {
                          Navigator.of(context).pushNamed('PublishPage');
                        }))
              ],
            ),
          ),
          Expanded(
            child: StaggeredGridView.countBuilder(
              crossAxisCount: 4,
              itemCount: _imprintInfo == null ? 0 : _imprintInfo.results.length,
              itemBuilder:
                  (BuildContext context, int index) => Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5.0))),
                    padding: EdgeInsets.all(5.0),
                    child: Stack(
                      children: <Widget>[
                        new Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(_imprintInfo == null ? "images/weather.jpg" : _imprintInfo.results[index].coverImage), fit: BoxFit.fitWidth)),
                        ),
                        Positioned(
                            top: 10.0,
                            right: 10.0,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(Icons.favorite, color: Colors.red, size: 14),
                                Text(_imprintInfo == null
                                    ? "0"
                                    : _imprintInfo.results[index].praiseCount
                                        .toString(), style: TextStyle(color: Colors.white, fontSize: 12.0),)
                              ],
                            ))
                      ],
                    ),
                  ),
              staggeredTileBuilder: (int index) =>
                  StaggeredTile.count(2, index.isEven ? 2 : 1),
              mainAxisSpacing: 4.0,
              crossAxisSpacing: 4.0,
            ),
          ),
        ],
      ),
    );
  }

  Future _request() async {
    Response response = await dio.get("/1/classes/Imprint");
    setState(() {
      _imprintInfo = ImprintInfo.fromJson(response.data);
    });
  }
}
