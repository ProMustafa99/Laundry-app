// // ignore_for_file: prefer_const_constructors

// ignore_for_file: prefer_const_constructors

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/Map/Map.dart';
import 'package:flutter_application_1/Test.dart';
import 'package:flutter_application_1/home.dart';
import 'package:flutter_application_1/layout.dart';
import 'package:flutter_application_1/model/order_model.dart';
import 'package:flutter_application_1/widget.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

class Order_page extends StatefulWidget {
  int Tsher, Jesn, Jaket, Shoes, Boxer, BedCover;

  String name_service;

  double Total;

  Order_page(this.name_service, this.Tsher, this.Jesn, this.Jaket, this.Shoes,
      this.Boxer, this.BedCover, this.Total);

  @override
  // ignore: no_logic_in_create_state
  State<Order_page> createState() => _Order_pageState(
      name_service, Tsher, Jesn, Jaket, Shoes, Boxer, BedCover, Total);
}

class _Order_pageState extends State<Order_page> {
  double padding_left_right = 15;
  double padding_top = 10;

  // ignore: non_constant_identifier_names
  int Tsher, Jesn, Jaket, Shoes, Boxer, BedCover;

  double Total;
  String name_service;

  _Order_pageState(this.name_service, this.Tsher, this.Jesn, this.Jaket,
      this.Shoes, this.Boxer, this.BedCover, this.Total);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              margin: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Color(0xffF8F9F9),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
              ),
              child: Column(
                children: [
                  ClipPath(
                    clipper: MultipleRoundedCurveClipper(),
                    child: Container(
                        height: 460,
                        color: Color(0xffECF0F1),
                        child: Column(
                          children: [
                            Padding(
                                padding: EdgeInsets.only(top: 10, bottom: 10),
                                child: Text(
                                  "# Mustafa Salameh ",
                                  style: TextStyle(fontSize: 15),
                                )),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: padding_left_right,
                                  right: padding_left_right,
                                  top: padding_top),
                              child: Row(
                                // ignore: prefer_const_literals_to_create_immutables
                                children: [
                                  Text(
                                    "Address",
                                    style: TextStyle(color: Color(0xff5D6D7E)),
                                  ),
                                  Spacer(),
                                  Text(
                                    "Amman/BSh Hostbital",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xff2C3E50)),
                                  )
                                ],
                              ),
                            ),
                            Divider(
                              color: Colors.grey,
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: padding_left_right,
                                  right: padding_left_right,
                                  top: padding_top),
                              child: Row(
                                // ignore: prefer_const_literals_to_create_immutables
                                children: [
                                  Text(
                                    "Status",
                                    style: TextStyle(color: Color(0xff5D6D7E)),
                                  ),
                                  Spacer(),
                                  Text(
                                    "${name_service}",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.red),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: padding_left_right,
                                  right: padding_left_right,
                                  top: padding_top),
                              child: Row(
                                // ignore: prefer_const_literals_to_create_immutables
                                children: [
                                  Text(
                                    "T-shert",
                                    style: TextStyle(color: Color(0xff5D6D7E)),
                                  ),
                                  Spacer(),
                                  Text(
                                    "${Tsher}",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xff2C3E50)),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: padding_left_right,
                                  right: padding_left_right,
                                  top: padding_top),
                              child: Row(
                                // ignore: prefer_const_literals_to_create_immutables
                                children: [
                                  Text(
                                    "Jens",
                                    style: TextStyle(color: Color(0xff5D6D7E)),
                                  ),
                                  Spacer(),
                                  Text(
                                    "${Jesn}",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xff2C3E50)),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: padding_left_right,
                                  right: padding_left_right,
                                  top: padding_top),
                              child: Row(
                                // ignore: prefer_const_literals_to_create_immutables
                                children: [
                                  Text(
                                    "Jaket",
                                    style: TextStyle(color: Color(0xff5D6D7E)),
                                  ),
                                  Spacer(),
                                  Text(
                                    "${Jaket}",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xff2C3E50)),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: padding_left_right,
                                  right: padding_left_right,
                                  top: padding_top),
                              child: Row(
                                // ignore: prefer_const_literals_to_create_immutables
                                children: [
                                  Text(
                                    "Shoes",
                                    style: TextStyle(color: Color(0xff5D6D7E)),
                                  ),
                                  Spacer(),
                                  Text(
                                    "${Shoes}",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xff2C3E50)),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: padding_left_right,
                                  right: padding_left_right,
                                  top: padding_top,
                                  bottom: 20),
                              child: Row(
                                // ignore: prefer_const_literals_to_create_immutables
                                children: [
                                  Text(
                                    "Boxer",
                                    style: TextStyle(color: Color(0xff5D6D7E)),
                                  ),
                                  Spacer(),
                                  Text(
                                    "${Boxer}",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xff2C3E50)),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: padding_left_right,
                                  right: padding_left_right,
                                  top: 0,
                                  bottom: 20),
                              child: Row(
                                // ignore: prefer_const_literals_to_create_immutables
                                children: [
                                  Text(
                                    "Bed Cover",
                                    style: TextStyle(color: Color(0xff5D6D7E)),
                                  ),
                                  Spacer(),
                                  Text(
                                    "${BedCover}",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xff2C3E50)),
                                  )
                                ],
                              ),
                            ),
                            DottedLine(),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: padding_left_right,
                                  right: padding_left_right,
                                  top: padding_top),
                              child: Row(
                                // ignore: prefer_const_literals_to_create_immutables
                                children: [
                                  Text(
                                    "Sub Total",
                                    style: TextStyle(color: Color(0xff5D6D7E)),
                                  ),
                                  Spacer(),
                                  Text(
                                    "${Total} JD",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xff2C3E50)),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: padding_left_right,
                                  right: padding_left_right,
                                  top: padding_top),
                              child: Row(
                                // ignore: prefer_const_literals_to_create_immutables
                                children: [
                                  Text(
                                    "Delivery",
                                    style: TextStyle(color: Color(0xff5D6D7E)),
                                  ),
                                  Spacer(),
                                  Text(
                                    "1.00 JD",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xff2C3E50)),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: padding_left_right,
                                  right: padding_left_right,
                                  top: 20),
                              child: Row(
                                // ignore: prefer_const_literals_to_create_immutables
                                children: [
                                  Text(
                                    "Total",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 25),
                                  ),
                                  Spacer(),
                                  Text(
                                    "${Total + 1} JD",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.red),
                                  )
                                ],
                              ),
                            ),
                          ],
                        )),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 100,
            ),
            Padding(
              padding: EdgeInsets.only(
                left: padding_left_right,
                right: padding_left_right,
                top: 10,
                bottom: 10,
              ),
              child: Container(
                width: double.infinity,
                child: RaisedButton(
                  onPressed: () {
                    setState(() {
                      r(name_service, Tsher, Jesn, Jaket, Shoes, Boxer,
                          BedCover, 0, Total + 1);
                    });

                  
                    navigateto_page(context,Map_page());
                  },
                  color: Colors.blue,
                  child: Text(
                    "Checkout",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

int index = 0;
