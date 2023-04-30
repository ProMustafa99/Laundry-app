import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/data_mangment/shared_preferances/shared-prferances.dart';
import 'package:flutter_application_1/layout.dart';
import 'package:flutter_application_1/style.dart';
import 'package:device_preview/device_preview.dart';
import 'login/login-info.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  var Data = Cash_Data();
  var cheeck_id = await Data.getData(key: "user_id");

  Widget Screen;

  if (cheeck_id == null) {
    Screen = login_info();
  } else {
    Screen = layout();
  }

  runApp(DevicePreview(builder: (context)=>MyApp(Screen = Screen)));
}

class MyApp extends StatelessWidget {
  final stratWidget;
  MyApp(this.stratWidget);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
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