// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
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

Widget Dr(context) {
  return Drawer(
    child: ListView(
      children: <Widget>[
        DrawerHeader(
          child: Container(
            width: double.infinity,
            height: 170,
            decoration: BoxDecoration(
                // color: Colors.white,
                ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              // ignore: prefer_const_literals_to_create_immutables
              children: <Widget>[
                CircleAvatar(
                  backgroundColor: Colors.blue,
                  radius: 20,
                  child: Text(
                    "M",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Text(
                      "Mustafa salameh",
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.edit,
                          size: 18,
                          color: Colors.blue,
                        ))
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "user@email.com",
                  style: TextStyle(color: Colors.blue, fontSize: 14),
                ),
              ],
            ),
          ),
        ),
        ListTile(
          leading: Icon(
            Icons.home,
            color: Colors.blue,
            size: 30,
          ),
          title: Text(
            "Home",
            style: TextStyle(),
          ),
          onTap: () {
            navigateto_page(context, Home());
          },
        ),
        ListTile(
          leading: Icon(
            Icons.check,
            color: Colors.blue,
            size: 30,
          ),
          title: Text(
            "Your Order",
            style: TextStyle(),
          ),
          onTap: () {},
        ),
        ListTile(
          leading: Icon(
            Icons.exit_to_app,
            color: Colors.blue,
            size: 30,
          ),
          title: Text("Logout"),
          onTap: () {},
        ),
      ],
    ),
  );
}

