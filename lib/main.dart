// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/data_mangment/shared_preferances/shared-prferances.dart';
import 'package:flutter_application_1/home.dart';
import 'package:flutter_application_1/style.dart';
import 'login/login-page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  var Data = Cash_Data();
  var cheeck_id = await Data.getData(key: "user_id");

  Widget Screen;

  if (cheeck_id == null) {
    Screen = login_page();
  } else {
    Screen = Home();
  }

  runApp(MyApp(Screen = Screen));
}

class MyApp extends StatelessWidget {
  final stratWidget;
  MyApp(this.stratWidget);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter ',
      theme: light,
      home: stratWidget,
    );
  }
}


class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: null);
  }
}