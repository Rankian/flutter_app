import 'package:flutter/material.dart';

class LoadingDialog extends Dialog {
  String text;

  LoadingDialog({Key key, @required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Material(
      type: MaterialType.transparency,
      child: new Center(
        child: new SizedBox(
          width: 130,
          height: 130,
          child: new Container(
            decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8.0)))),
            color: Color(0x00000000),
            child: new Column(
              mainAxisAlignment:  MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                new CircularProgressIndicator(),
                new Padding(padding: EdgeInsets.only(top: 20.0)),
                new Text(text, style: new TextStyle(color: Colors.white, fontSize: 12.0),)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
