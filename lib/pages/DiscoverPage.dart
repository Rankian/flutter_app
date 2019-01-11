import 'package:common_utils/common_utils.dart';
import 'package:simple_permissions/simple_permissions.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/model/weather/Weather.dart';
import 'package:amap_location/amap_location.dart';

class DiscoverPage extends StatefulWidget {
  @override
  DiscoverState createState() => new DiscoverState();
}

class DiscoverState extends State<DiscoverPage>
    with AutomaticKeepAliveClientMixin {
  Weather weather;
  String weatherAddress;
  ScrollController _scrollController;
  AMapLocation _location;
  bool _showTop = false;

  @override
  void initState() {
    super.initState();
    _checkPermission();

    _scrollController = ScrollController();
    _scrollController.addListener(() {
      setState(() {
        _showTop = _scrollController.position.pixels >= 75;
      });
    });
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: new Container(
      child: new Stack(
        children: <Widget>[
          new Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("images/weather.jpg"), fit: BoxFit.fill)),
          ),
          weather == null
              ? Center(
                  child: CircularProgressIndicator(
                      strokeWidth: 2.0,
                      valueColor: AlwaysStoppedAnimation(Colors.white)),
                )
              : LayoutBuilder(builder:
                  (BuildContext context, BoxConstraints viewportConstraints) {
                  return SingleChildScrollView(
                    controller: _scrollController,
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                          minHeight: viewportConstraints.maxHeight),
                      child: IntrinsicHeight(
                        child: Container(
                          padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
                          child: new Center(
                            child: new Column(
                              children: <Widget>[
                                new Container(
                                  child: new Center(
                                      child: new Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: <Widget>[
                                          Container(
                                            margin: EdgeInsets.only(top: 10),
                                            child: new Text(
                                              weather == null
                                                  ? "定位中"
                                                  : weatherAddress +
                                                  "    " +
                                                  DateUtil.formatZHDateTime(
                                                      weather.realtime.time,
                                                      DateFormat
                                                          .ZH_YEAR_MONTH_DAY,
                                                      ":"),
                                              style: new TextStyle(
                                                  fontSize: 14.0,
                                                  color: Colors.white),
                                            ),
                                          ),
                                          Container(
                                            padding: EdgeInsets.only(right: 26),
                                            margin: EdgeInsets.only(top: 20),
                                            child: Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.end,
                                              crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                              children: <Widget>[
                                                new Text(
                                                  weather == null
                                                      ? "-"
                                                      : weather.realtime.temp,
                                                  style: new TextStyle(
                                                      fontSize: 50.0,
                                                      color: Colors.white),
                                                ),
                                                new Text(
                                                  " ℃",
                                                  style: new TextStyle(
                                                      fontSize: 50.0,
                                                      color: Colors.white),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            padding:
                                            EdgeInsets.only(top: 5, right: 26),
                                            child: Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.end,
                                              crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                              children: <Widget>[
                                                new Text(
                                                  weather == null
                                                      ? "-"
                                                      : weather.realtime.weather,
                                                  style: new TextStyle(
                                                      fontSize: 12.0,
                                                      color: Colors.white),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      )),
                                ),
                                //中部逐小时预报
                                Container(
                                  height: 80,
                                  margin: EdgeInsets.only(
                                      top: 100,
                                      bottom: 30,
                                      left: 5.0,
                                      right: 5.0),
                                  decoration: BoxDecoration(
                                      color: Color(0x4DFFFFFF),
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(5.0))),
                                  child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: weather.weatherDetailsInfo
                                          .weather3HoursDetailsInfos.length,
                                      itemBuilder: (context, i) {
                                        return GestureDetector(
                                          onTap: () {},
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                                left: 10.0,
                                                right: 10.0,
                                                top: 5.0,
                                                bottom: 5.0),
                                            child: Column(
                                              mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                              crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                              children: <Widget>[
                                                Text(
                                                  weather
                                                      .weatherDetailsInfo
                                                      .weather3HoursDetailsInfos[
                                                  i]
                                                      .startTime
                                                      .substring(11, 16) +
                                                      "~" +
                                                      weather
                                                          .weatherDetailsInfo
                                                          .weather3HoursDetailsInfos[
                                                      i]
                                                          .endTime
                                                          .substring(11, 16),
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 12.0),
                                                ),
                                                Text(
                                                  weather
                                                      .weatherDetailsInfo
                                                      .weather3HoursDetailsInfos[
                                                  i]
                                                      .weather,
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 12.0),
                                                ),
                                                Text(
                                                  weather
                                                      .weatherDetailsInfo
                                                      .weather3HoursDetailsInfos[
                                                  i]
                                                      .lowerestTemperature +
                                                      "~" +
                                                      weather
                                                          .weatherDetailsInfo
                                                          .weather3HoursDetailsInfos[
                                                      i]
                                                          .highestTemperature +
                                                      "℃",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 12.0),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      }),
                                ),
                                Expanded(
                                    child: Container(
                                      height: 220,
                                      padding: EdgeInsets.only(left: 5.0, right: 5.0),
                                      margin: EdgeInsets.only(left: 5.0, right: 5.0),
                                      decoration: BoxDecoration(
                                          color: Color(0x4DFFFFFF),
                                          borderRadius:
                                          BorderRadius.all(Radius.circular(5.0))),
                                      child: ListView.builder(
                                          physics: NeverScrollableScrollPhysics(),
                                          itemCount: weather.weathers.length,
                                          itemBuilder: (context, i) {
                                            return GestureDetector(
                                                onTap: () {},
                                                child: Padding(
                                                  padding: EdgeInsets.all(8.0),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                    crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                    children: <Widget>[
                                                      Text(
                                                        weather.weathers[i].week,
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 12),
                                                      ),
                                                      Text(
                                                        weather.weathers[i].weather,
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 12),
                                                      ),
                                                      Row(
                                                        children: <Widget>[
                                                          Text(
                                                            weather.weathers[i]
                                                                .temp_day_c +
                                                                "~" +
                                                                weather.weathers[i]
                                                                    .temp_night_c +
                                                                "℃",
                                                            style: TextStyle(
                                                                color: Colors.white,
                                                                fontSize: 12),
                                                          )
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                ));
                                          }),
                                    ))
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }),
          Offstage(
            offstage: !_showTop,
            child: Container(
              height: 60,
              decoration: BoxDecoration(color: Colors.blueAccent[400]),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.cloud_queue,
                      color: Colors.white,
                      size: 18,
                    ),
                    Text(
                      _location != null && weather != null
                          ? _location.district +
                              " " +
                              _location.street +
                              " " +
                              weather.realtime.temp +
                              "℃"
                          : "",
                      style: TextStyle(color: Colors.white, fontSize: 12.0),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    ));
  }

  Future _requestWeather(String city) async {
    Dio dio = new Dio();
    Response response = await dio
        .get("http://aider.meizu.com/app/weather/listWeather?cityIds=" + city);
    setState(() {
      weather = Weather.fromJson(response.data);
    });
  }

  Future _startLocation() async {
    await AMapLocationClient.startup(new AMapLocationOption(
        desiredAccuracy: CLLocationAccuracy.kCLLocationAccuracyHundredMeters));
//    await AMapLocationClient.getLocation(true);
    AMapLocationClient.onLocationUpate.listen((AMapLocation loc) {
      if (!mounted) return;
      setState(() {
        print("定位成功:" + loc.city);
        _location = loc;
        weatherAddress = loc.district;
        _requestWeather("101040100");
        AMapLocationClient.stopLocation();
      });
    });
    AMapLocationClient.startLocation();
  }

  void _checkPermission() async {
    bool hasPermission =
        await SimplePermissions.checkPermission(Permission.WhenInUseLocation);
    print("定位权限：" + hasPermission.toString());
    if (!hasPermission) {
      PermissionStatus requestPermissionResult =
          await SimplePermissions.requestPermission(
              Permission.WhenInUseLocation);
      print("定位权限未打开");
    } else {
      _startLocation();
    }
  }

  @override
  void dispose() {
    AMapLocationClient.shutdown();
    super.dispose();
  }
}
