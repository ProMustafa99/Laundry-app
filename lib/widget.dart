// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_1/data_mangment/shared_preferances/shared-prferances.dart';
import 'package:flutter_application_1/home.dart';
import 'package:fluttertoast/fluttertoast.dart';

void navigateto_and_push(context, Widget) => Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => Widget,
        ), (Route<dynamic> route) {
      return false;
    });

void Tosta_mes({required String mess, Color? color}) => Fluttertoast.showToast(
    msg: mess,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 20,
    backgroundColor: color,
    textColor: Colors.white,
    fontSize: 16.0);

void navigateto_page(context, Widget) => Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => Widget,
    ));

Widget Divider_line() {
  return Container(
    height: 2,
    color: Colors.grey,
  );
}

    var Data = Cash_Data();


var test ;


