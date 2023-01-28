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

  bool show_Tshert = true,
      show_Jens = true,
      show_Jaket = true,
      show_shose = true,
      show_Boxer = true,
      show_bedcover = true;

  _Order_pageState(this.name_service, this.Tsher, this.Jesn, this.Jaket,
      this.Shoes, this.Boxer, this.BedCover, this.Total);

  void chang_state_items() {
    if (this.Tsher == 0) {
      setState(() {
        show_Tshert = false;
      });
    }

    if (this.Jesn == 0) {
      setState(() {
        show_Jens = false;
      });
    }

    if (this.Jaket == 0) {
      setState(() {
        show_Jaket = false;
      });
    }

    if (this.Shoes == 0) {
      setState(() {
        show_shose = false;
      });
    }

    if (this.Boxer == 0) {
      setState(() {
        show_Boxer = false;
      });
    }

    if (this.BedCover == 0) {
      setState(() {
        show_bedcover = false;
      });
    }
  }

  @override
  void initState() {
    chang_state_items();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: EdgeInsets.only(left: 15, right: 15),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
                child: Container(
                  width: double.infinity,
                  height: 150,
                  color: Colors.white,
                  child: Column(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "# Mustafa Slamaeh ",
                        style: TextStyle(fontSize: 15),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          Icon(Icons.add_location_alt_sharp),
                          Text(
                            "Amman/BSh Hostbital",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xff2C3E50)),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),
                child: Container(
                    width: double.infinity,
                    height: 480,
                    color: Colors.white,
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 15, top: 20, right: 15),
                      child: Column(
                        children: [
                          Row(
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
                          const SizedBox(
                            height: 15,
                          ),

                          Visibility(
                            visible: show_Tshert,
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

                          const SizedBox(
                            height: 7,
                          ),

                          Visibility(
                            visible: show_Jens,
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
                          const SizedBox(
                            height: 7,
                          ),

                          Visibility(
                            visible: show_Jaket,
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
                          const SizedBox(
                            height: 7,
                          ),

                          Visibility(
                            visible: show_shose,
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
                          const SizedBox(
                            height: 7,
                          ),

                          Visibility(
                            visible: show_Boxer,
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
                          const SizedBox(
                            height: 7,
                          ),

                          Visibility(
                            visible: show_bedcover,
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
                          const SizedBox(
                            height: 7,
                          ),

                           DottedLine(),
                             const SizedBox(
                              height: 15,
                          ),

                           

                          
                          Row(
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
                          const SizedBox(
                            height: 7,
                          ),
                          Row(
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
                          const SizedBox(
                            height: 7,
                          ),
                          Row(
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

                          Spacer(),

                          Row(
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              Image(
                                image: AssetImage("assets/page1/bar-code.png"),
                                width: 100,
                              ),
                              Image(
                                image: AssetImage("assets/page1/bar-code.png"),
                                width: 100,
                              ),
                              Image(
                                image: AssetImage("assets/page1/bar-code.png"),
                                width: 100,
                              ),
                            ],
                          ),
                          Container(
                            width: double.infinity,
                            child: RaisedButton(
                              onPressed: () {
                                setState(() {
                                  r(name_service, Tsher, Jesn, Jaket, Shoes,
                                      Boxer, BedCover, 0, Total + 1);
                                });

                                navigateto_page(context, Map_page());
                              },
                              color: Colors.blue,
                              child: Text(
                                "Checkout",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )),
              ),
            ],
          ),
        ));
  }
}

int index = 0;


