import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showPleaseFillUpToast(String string) {
  Fluttertoast.showToast(
    msg: "Please fill up all the fields",
    toastLength: Toast.LENGTH_SHORT,
    //gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: Colors.red,
    textColor: Colors.white,
    fontSize: 16.0
  );
}

class CustomToast {
  static void show(BuildContext context, String message,
      {ToastGravity gravity = ToastGravity.START,
       toastLength = Toast.LENGTH_SHORT,
      Color backgroundColor = Colors.black,
      double fontSize = 16,
      Color textColor = Colors.white}) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: TextStyle(
            color: textColor,
            fontSize: fontSize,
          ),
        ),
        duration: Duration(seconds: 2),
        backgroundColor: backgroundColor,
        behavior: SnackBarBehavior.floating,
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        // dismissDirection: DismissDirection.horizontal,
        // margin: EdgeInsets.all(40.0)
        // .only(
        //   bottom: gravity == ToastGravity.BOTTOM ? 16 : 0,
        //   top: gravity == ToastGravity.TOP ? 16 : 0,
        //   left: gravity == ToastGravity.START ? 16 : 0,
        //   right: gravity == ToastGravity.END ? 16 : 0,
        // ),
      ),
    );
  }
}

enum ToastGravity { TOP, BOTTOM, START, END }
