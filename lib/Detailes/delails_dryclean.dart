import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/order/order_page.dart';
import 'package:flutter_application_1/widget.dart';

class Details_dry_clean extends StatefulWidget {
  String name_service;

  Details_dry_clean(this.name_service);

  @override
  State<Details_dry_clean> createState() => _Details_dry_cleanState(this.name_service);
}

class _Details_dry_cleanState extends State<Details_dry_clean> {
  String name_service;

  _Details_dry_cleanState(this.name_service);

  int Tshirt = 0;
  double PrTshirt = 0.5;
  bool VTshirt = false;

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

  int Total_Type_Widget = 0;
  double Total_price = 0;

  bool Vbutton = false;

  Color color_button = Colors.blue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dry Clean "),
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
                                onPressed: () {
                                  setState(() {
                                    Tshirt++;
                                    Total_Type_Widget = Total_Type_Widget + 1;
                                    VTshirt = true;
                                    Total_price = Total_price + PrTshirt;
                                    Vbutton = true;
                                  });
                                },
                                icon: Icon(
                                  Icons.add,
                                  color: Colors.blue,
                                ),
                              ),
                              Text(
                                "${Tshirt}",
                                style: TextStyle(fontSize: 20),
                              ),
                              IconButton(
                                onPressed: VTshirt
                                    ? () {
                                        setState(() {
                                          Tshirt--;
                                          Total_Type_Widget =
                                              Total_Type_Widget - 1;

                                          Total_price = Total_price - PrTshirt;
                                          if (Total_price == 0) {
                                            Vbutton = false;
                                          }
                                        });

                                        if (Tshirt == 0) {
                                          setState(() {
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
                                          Total_Type_Widget =
                                              Total_Type_Widget - 1;

                                          Total_price = Total_price - PrJeans;
                                          if (Total_price == 0) {
                                            Vbutton = false;
                                          }
                                        });

                                        if (Jeans == 0) {
                                          setState(() {
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
                                          Total_Type_Widget =
                                              Total_Type_Widget - 1;
                                          Total_price = Total_price - PrJaket;

                                          if (Total_price == 0) {
                                            Vbutton = false;
                                          }
                                        });

                                        if (Jaket == 0) {
                                          setState(() {
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
                                          Total_Type_Widget =
                                              Total_Type_Widget - 1;

                                          Total_price = Total_price - PrBoxer;

                                          if (Total_price == 0) {
                                            Vbutton = false;
                                          }
                                        });

                                        if (Boxer == 0) {
                                          setState(() {
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
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: FadeInDown(
          child: Container(
              height: 80.0,
              width: double.maxFinite,
              color :Color(0xFF3C79F5),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: RaisedButton(
                      onPressed: Vbutton
                          ? () {
                              navigateto_page(
                                  context,
                                  Order_page(
                                    this.name_service,
                                    this.Tshirt,
                                    this.Jeans,
                                    this.Jaket,
                                    this.Shoes,
                                    this.Boxer,
                                    this.BedCover,
                                    this.Total_price,
                                  ));
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
