import 'package:flutter/material.dart';
import 'package:flutter_app/view/LoadingDialog.dart';

class DialogUtils {
  static void showLoadingDialog(BuildContext context){
    showDialog(context: context,
    barrierDismissible: false,
    builder: (BuildContext context){
      return new LoadingDialog(
        text: "正在加载",
      );
    });
  }

}