// ignore_for_file: prefer_const_constructors, non_constant_identifier_names

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/data_mangment/cubit_app.dart';
import 'package:flutter_application_1/data_mangment/status_app.dart';
import 'package:flutter_application_1/order/order_page.dart';
import 'package:flutter_application_1/widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Detailes extends StatefulWidget {
  String name_service;

  Detailes(this.name_service);

  @override
  State<Detailes> createState() => _DetailesState(this.name_service);
}

class _DetailesState extends State<Detailes> {
  String name_service;
  _DetailesState(this.name_service);


  int Tshirt = 0; // Number Of Teshert
  double PrTshirt = 0.5; // Price PrTshirt
  bool VTshirt = false; // if Number of Tshirt < 1 hidden -

  int Jeans = 0;
  double PrJeans = 0.5;
  bool VJeans = false;

  int Jaket = 0;
  double PrJaket = 1.5;
  bool VJaket = false;

  int Shoes = 0;
  double PrShoes = 1.5;
  bool VShoes = false;

  int Boxer = 0;
  double PrBoxer = 1.5;
  bool VBoxer = false;

  int BedCover = 0;
  double PrBedCover = 2.5;
  bool VBedCover = false;


  // Number of Pieces
  int Total_Type_Widget = 0;

  // Total Price
  double Total_price = 0;

  bool Vbutton = false;

  Color color_button = Colors.blue;


  Map<String, dynamic> myorder = {};


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Detailes Page"),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              // For T-shirt
              FadeInDown(
                delay: Duration(milliseconds: 300),
                child: Container(
                  child: Container(
                      width: double.infinity,
                      margin: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.all(15),
                            child: Image.asset(
                              "assets/page1/shirt1.png",
                              width: 80,
                              height: 80,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            children: [
                              Text(
                                "T-sher",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 7,
                              ),
                              Text(
                                "${PrTshirt} JD ",
                                style: TextStyle(
                                  color: Colors.blue,
                                ),
                              )
                            ],
                          ),
                          Spacer(),
                          Container(
                              child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                onPressed: ()
                                {
                                  setState(()
                                  {
                                    Tshirt++;
                                    Total_Type_Widget = Total_Type_Widget + 1;
                                    Total_price = Total_price + PrTshirt;
                                    Vbutton = true;
                                    VTshirt = true;
                                    myorder["بلوزة"] =Tshirt;
                                  });
                                },
                                icon: Icon(Icons.add, color: Colors.blue,),
                              ),
                              Text("${Tshirt}", style: TextStyle(fontSize: 20),),
                              IconButton(
                                onPressed: VTshirt
                                    ? () {
                                        setState(()
                                        {
                                          Tshirt--;
                                          Total_Type_Widget = Total_Type_Widget - 1;
                                          Total_price = Total_price - PrTshirt;
                                          myorder['بلوزة'] = Tshirt;
                                          if (Total_price == 0) {
                                            Vbutton = false;
                                          }

                                        });


                                        if (Tshirt == 0)
                                        {
                                          setState(() {
                                            myorder.remove("بلوزة");
                                            VTshirt = false;
                                          });
                                        }

                                      }
                                    : null,
                                icon: Icon(
                                  Icons.remove,
                                  color: Colors.blue,
                                ),
                              ),
                            ],
                          ))
                        ],
                      )),
                ),
              ),

              // For Jeans
              FadeInDown(
                delay: Duration(milliseconds: 430),
                child: Container(
                  child: Container(
                      width: double.infinity,
                      margin: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.all(15),
                            child: Image.asset(
                              "assets/page1/jeans.png",
                              width: 80,
                              height: 80,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            children: [
                              Text(
                                "Jeans",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 7,
                              ),
                              Text(
                                "${PrJeans} JD",
                                style: TextStyle(color: Colors.blue),
                              )
                            ],
                          ),
                          Spacer(),
                          Container(
                              child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    Jeans++;
                                    Total_Type_Widget = Total_Type_Widget + 1;
                                    VJeans = true;
                                    Total_price = Total_price + PrJeans;
                                    Vbutton = true;
                                    myorder["بنطلون"] =Jeans;
                                    print(myorder);
                                  });
                                },
                                icon: Icon(Icons.add, color: Colors.blue),
                              ),
                              Text(
                                "${Jeans}",
                                style: TextStyle(fontSize: 20),
                              ),
                              IconButton(
                                onPressed: VJeans
                                    ? () {
                                        setState(() {
                                          Jeans--;
                                          Total_Type_Widget = Total_Type_Widget - 1;
                                          Total_price = Total_price - PrJeans;
                                          myorder["بنطلون"] =Jeans;

                                          if (Total_price == 0) {
                                            Vbutton = false;
                                          }
                                        });

                                        if (Jeans == 0) {
                                          setState(() {
                                            myorder.remove("بنطلون");
                                            VJeans = false;
                                          });
                                        }
                                      }
                                    : null,
                                icon: Icon(Icons.remove, color: Colors.blue),
                              ),
                            ],
                          ))
                        ],
                      )),
                ),
              ),

              // For jaket
              FadeInDown(
                delay: Duration(milliseconds: 530),
                child: Container(
                  child: Container(
                      width: double.infinity,
                      margin: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.all(15),
                            child: Image.asset(
                              "assets/page1/jacket.png",
                              width: 80,
                              height: 80,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            children: [
                              Text(
                                "Jaket",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 7,
                              ),
                              Text(
                                "${PrJaket} JD",
                                style: TextStyle(color: Colors.blue),
                              )
                            ],
                          ),
                          Spacer(),
                          Container(
                              child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    Jaket++;
                                    Total_Type_Widget = Total_Type_Widget + 1;
                                    VJaket = true;
                                    Total_price = Total_price + PrJaket;
                                    myorder["جاكيت"] =Jaket;
                                    Vbutton = true;
                                  });
                                },
                                icon: Icon(Icons.add, color: Colors.blue),
                              ),
                              Text(
                                "${Jaket}",
                                style: TextStyle(fontSize: 20),
                              ),
                              IconButton(
                                onPressed: VJaket
                                    ? () {
                                        setState(() {
                                          Jaket--;
                                          Total_Type_Widget = Total_Type_Widget - 1;
                                          Total_price = Total_price - PrJaket;
                                          myorder["جاكيت"] =Jaket;

                                          if (Total_price == 0) {
                                            Vbutton = false;
                                          }
                                        });

                                        if (Jaket == 0) {
                                          setState(() {
                                            myorder.remove("جاكيت");
                                            VJaket = false;
                                          });
                                        }
                                      }
                                    : null,
                                icon: Icon(Icons.remove, color: Colors.blue),
                              ),
                            ],
                          ))
                        ],
                      )),
                ),
              ),

              // For Shoes
              FadeInDown(
                delay: Duration(milliseconds: 630),
                child: Container(
                  child: Container(
                      width: double.infinity,
                      margin: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.all(15),
                            child: Image.asset(
                              "assets/page1/shoe.png",
                              width: 80,
                              height: 80,
                            ),
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          Column(
                            children: [
                              Text(
                                "Shoes",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 7,
                              ),
                              Text(
                                "${PrShoes} JD",
                                style: TextStyle(color: Colors.blue),
                              )
                            ],
                          ),
                          Spacer(),
                          Container(
                              child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    Shoes++;
                                    Total_Type_Widget = Total_Type_Widget + 1;
                                    VShoes = true;
                                    Total_price = Total_price + PrShoes;
                                    myorder["حذاء"] =Shoes;
                                    Vbutton = true;
                                  });
                                },
                                icon: Icon(Icons.add, color: Colors.blue),
                              ),
                              Text(
                                "${Shoes}",
                                style: TextStyle(fontSize: 20),
                              ),
                              IconButton(
                                onPressed: VShoes
                                    ? () {
                                        setState(() {
                                          Shoes--;
                                          Total_Type_Widget = Total_Type_Widget - 1;
                                          Total_price = Total_price - PrShoes;
                                          myorder["حذاء"] =Shoes;

                                          if (Total_price == 0) {
                                            Vbutton = false;
                                          }
                                        });

                                        if (Shoes == 0) {
                                          setState(() {
                                            myorder.remove("حذاء");
                                            VShoes = false;
                                          });
                                        }
                                      }
                                    : null,
                                icon: Icon(Icons.remove, color: Colors.blue),
                              ),
                            ],
                          ))
                        ],
                      )),
                ),
              ),

              // For Boxer

              FadeInDown(
                delay: Duration(milliseconds: 630),
                child: Container(
                  child: Container(
                      width: double.infinity,
                      margin: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.all(15),
                            child: Image.asset(
                              "assets/page1/briefs.png",
                              width: 80,
                              height: 80,
                            ),
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          Column(
                            children: [
                              Text(
                                "Boxer",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 7,
                              ),
                              Text(
                                "${PrBoxer} JD",
                                style: TextStyle(color: Colors.blue),
                              )
                            ],
                          ),
                          Spacer(),
                          Container(
                              child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    Boxer++;
                                    Total_Type_Widget = Total_Type_Widget + 1;
                                    VBoxer = true;
                                    Total_price = Total_price + PrBoxer;
                                    myorder["بوكسر"] =Boxer;
                                    Vbutton = true;
                                  });
                                },
                                icon: Icon(Icons.add, color: Colors.blue),
                              ),
                              Text(
                                "${Boxer}",
                                style: TextStyle(fontSize: 20),
                              ),
                              IconButton(
                                onPressed: VBoxer
                                    ? () {
                                        setState(() {
                                          Boxer--;
                                          Total_Type_Widget = Total_Type_Widget - 1;
                                          myorder["بوكسر"] =Boxer;
                                          Total_price = Total_price - PrBoxer;

                                          if (Total_price == 0) {
                                            Vbutton = false;
                                          }
                                        });

                                        if (Boxer == 0) {
                                          setState(() {
                                            myorder.remove("بوكسر");
                                            VBoxer = false;
                                          });
                                        }
                                      }
                                    : null,
                                icon: Icon(Icons.remove, color: Colors.blue),
                              ),
                            ],
                          ))
                        ],
                      )),
                ),
              ),

              // For Bed Vover

              FadeInDown(
                delay: Duration(milliseconds: 630),
                child: Container(
                  child: Container(
                      width: double.infinity,
                      margin: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.all(15),
                            child: Image.asset(
                              "assets/page1/bed-sheets.png",
                              width: 80,
                              height: 80,
                            ),
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          Column(
                            children: [
                              Text(
                                "Bed Cover",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 7,
                              ),
                              Text(
                                "${PrBedCover} JD",
                                style: TextStyle(color: Colors.blue),
                              )
                            ],
                          ),
                          Spacer(),
                          Container(
                              child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    BedCover++;
                                    Total_Type_Widget = Total_Type_Widget + 1;
                                    VBedCover = true;
                                    Total_price = Total_price + PrBedCover;
                                    myorder["حرام"] =BedCover;
                                    Vbutton = true;
                                  });
                                },
                                icon: Icon(Icons.add, color: Colors.blue),
                              ),
                              Text(
                                "${BedCover}",
                                style: TextStyle(fontSize: 20),
                              ),
                              IconButton(
                                onPressed: VBedCover
                                    ? () {
                                        setState(() {
                                          BedCover--;
                                          Total_Type_Widget = Total_Type_Widget - 1;
                                          Total_price = Total_price - PrBedCover;
                                          myorder["حرام"] =BedCover;

                                          if (Total_price == 0) {
                                            Vbutton = false;
                                          }
                                        });

                                        if (BedCover == 0) {
                                          setState(() {
                                            myorder.remove("حرام");
                                            VBedCover = false;
                                          });
                                        }
                                      }
                                    : null,
                                icon: Icon(Icons.remove, color: Colors.blue),
                              ),
                            ],
                          ))
                        ],
                      )),
                ),
              ),
            ],
          ),
        ),
      ),

      bottomNavigationBar: BottomAppBar(
        child: FadeInDown(
          child: Container(
              height: 80.0,
              width: double.maxFinite,
              color: Color(0xFF3C79F5),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: RaisedButton(
                      onPressed: Vbutton
                          ? ()
                              {
                                myorder['المجموع'] =Total_price+1;
                                myorder['السعر'] =Total_price;
                                myorder["الخدمة "] = "غسيل";
                                myorder ["التوصيل"] = 1;
                                myorder['عدد القطع'] =Total_Type_Widget;
                                navigateto_page(context, Order_page(myorder));
                            }
                          : null,
                      padding: const EdgeInsets.all(0.0),
                      color: color_button,
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: 20, right: 20, bottom: 20, top: 20),
                        child: Row(
                          children: [
                            Text(
                              "${Total_Type_Widget}",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            ),
                            SizedBox(
                              width: 14,
                            ),
                            Text(
                              "View Order",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            ),
                            Spacer(),
                            Text(
                              "${Total_price} JD",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
