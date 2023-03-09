import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class point_page extends StatefulWidget {
  const point_page({Key? key}) : super(key: key);

  @override
  State<point_page> createState() => _point_pageState();
}

class _point_pageState extends State<point_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
          padding: EdgeInsets.all(13),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Container(
                width: double.infinity,
                height: double.infinity,
                color: Colors.white,
                child: detailes_points()),
          )),
    );
  }
}

Widget detailes_points() {
  return Padding(
    padding: const EdgeInsets.all(13.0),
    child: Column(
      children: [
        Container(
          width: double.infinity,
          color: Color(0xff499AD4),
          child: Column(
            children: [
              Text("Available Points balance ",
                  style: TextStyle(color: Colors.white)),
              Row(
                children: [
                  Icon(Icons.account_balance_wallet, color: Colors.white,),
                  Text("150 Point", style: TextStyle(color: Colors.white)),
                ],
              ),
              Row(
                children: [
                  Icon(Icons.monetization_on , color: Colors.white,),
                  Text("2.5 JD", style: TextStyle(color: Colors.white)),
                ],
              ),
            ],
          ),
        )
      ],
    ),
  );
}
