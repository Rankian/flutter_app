import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/model/User.dart';
import 'package:flutter_app/utils/ACache.dart';
import 'package:flutter_app/utils/DioUtils.dart';
import 'package:flutter_app/view/LoadingDialog.dart';
import 'package:city_pickers/city_pickers.dart';

class UserInfoPage extends StatefulWidget {
  @override
  UserInfoPageState createState() => UserInfoPageState();
}

class UserInfoPageState extends State<UserInfoPage>{

  EdgeInsetsGeometry padding = EdgeInsets.only(left: 15.0, top: 10.0, right: 15.0, bottom: 10.0);

  User _user;
  File _selectPicFile;

  @override
  void initState() {
    super.initState();
  }

  Future _getUser() async {
//    new Future.delayed(const Duration(seconds: 1), () => futureTask);
    Future.delayed(const Duration(seconds: 3), (){
      ACache.getString("user").then((json){
        setState(() {
          _user = User.fromJSON(jsonDecode(json));
          });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(child: Icon(Icons.arrow_back_ios),onTap: (){Navigator.of(context).pop();},),
        centerTitle: true,
        backgroundColor: Colors.teal[300],
        title: Text("个人资料", style: TextStyle(color: Colors.white, fontSize: 18.0),),
      ),
      backgroundColor: Colors.grey[300],
      body: FutureBuilder(builder: _buildFuture, future: _getUser(),
      ),
    );
  }

  Widget _buildFuture(BuildContext context, AsyncSnapshot snapshot){
    if(_user == null){
      return LoadingDialog(text: "加载中");
    }else{
      return _createBody();
    }
  }
  
  Widget _createBody(){
    return Container(margin: EdgeInsets.all(15.0), decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(8.0))),
      height: MediaQuery.of(context).size.height,
      child: SingleChildScrollView(child: Column(
        children: <Widget>[
          //头像
          _avatarItem(),
          Divider(height: 1.0),
          //昵称
          _nicknameItem(),
          Divider(height: 1.0),
          //手机号码
          _phoneItem(),
          Divider(height: 1.0),
          //性别
          _genderItem(),
          Divider(height: 1.0),
          //生日
          _birthdayItem(),
          Divider(height: 1.0),
          //地区
          _areaItem(context),
          Divider(height: 1.0),
        ],
      ),),);
  }
  
  Widget _avatarItem(){
    return Padding(padding: padding, child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        _title("头像"),
        Row(crossAxisAlignment: CrossAxisAlignment.center, children: <Widget>[
          GestureDetector(onTap: _getImage,
          child: ClipOval(
            child: SizedBox(
              width: 50,
              height: 50,
              child: _user == null ? Image.asset("images/default_avatar.png") : Image.network(_user.avatar,),
            ),
          ),),
          Padding(padding: EdgeInsets.only(left: 5.0, right: 5.0)),
          Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 18,)
        ],)
      ],
    ),);
  }

  Widget _nicknameItem(){
    return Padding(padding: padding, child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        _title("昵称"),
        Row(crossAxisAlignment: CrossAxisAlignment.center, children: <Widget>[
          Text(_user == null ? "" : _user.nickname, style: TextStyle(color: Colors.grey[700], fontSize: 16.0)),
          Padding(padding: EdgeInsets.only(left: 5.0, right: 5.0)),
          Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 18,)
        ],)
      ],
    ),);
  }

  Widget _genderItem(){
    return Padding(padding: padding, child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        _title("性别"),
        Row(crossAxisAlignment: CrossAxisAlignment.center, children: <Widget>[
          Text(_user == null ? "" : _user.gender == 1 ? "男" : "女", style: TextStyle(color: Colors.grey[700], fontSize: 16.0)),
          Padding(padding: EdgeInsets.only(left: 5.0, right: 5.0)),
          Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 18,)
        ],)
      ],
    ),);
  }

  Widget _birthdayItem(){
    return Padding(padding: padding, child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        _title("生日"),
        Row(crossAxisAlignment: CrossAxisAlignment.center, children: <Widget>[
          Text(_user == null ? "" : _user.birthday, style: TextStyle(color: Colors.grey[700], fontSize: 16.0)),
          Padding(padding: EdgeInsets.only(left: 5.0, right: 5.0)),
          Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 18,)
        ],)
      ],
    ),);
  }

  Widget _areaItem(BuildContext context){
    return Padding(padding: padding, child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        _title("地区"),
        GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: (){ _showCityPicker(context); },
          child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: <Widget>[
            Text(_user == null ? "" : _user.address, style: TextStyle(color: Colors.grey[700], fontSize: 16.0)),
            Padding(padding: EdgeInsets.only(left: 5.0, right: 5.0)),
            Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 18,)
          ],),
        )
      ],
    ),);
  }

  Widget _phoneItem(){
    return Padding(padding: padding, child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        _title("手机号码"),
        Row(crossAxisAlignment: CrossAxisAlignment.center, children: <Widget>[
          Text(_user == null ? "" : _getPhone(_user.mobilePhoneNumber), style: TextStyle(color: Colors.grey[700], fontSize: 16.0)),
          Padding(padding: EdgeInsets.only(left: 5.0, right: 5.0)),
        ],)
      ],
    ),);
  }

  Widget _title(String title){
    return Container(width: 120.0, child: Padding(padding: EdgeInsets.all(10.0),
      child: Text(title, style: TextStyle(color: Colors.grey[700], fontSize: 18.0),),),);
  }

  String _getPhone(String phone){
    return "${phone.substring(0, 3)}****${phone.substring(7, 11)}";
  }

  Future<void> _getImage() async {
  }

  Future<void> _uploadPicture(String filePath) async{
    showLoadingDialog();
    print("上传文件path:$filePath");
    Response response = await DioUtils.get(contentType: "image/png").post("/2/files", data: filePath);
    setState(() {
      print(jsonEncode(response.data));
      Navigator.of(context).pop();
    });
  }

  Future _showCityPicker(BuildContext context) async {
    Result result = await CityPickers.showCityPicker(context: context);
  }

  void showLoadingDialog(){
    showDialog(context: context, builder: (c){
      return LoadingDialog(text: "正在上传...",);
    });
  }


}