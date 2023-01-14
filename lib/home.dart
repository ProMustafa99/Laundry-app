// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_application_1/details.dart';
import 'package:flutter_application_1/widget.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double width_and_height_box = 120;

  Widget service(int number_service, name_service) {
    String image = "";

    if (number_service == 1) {
      image = "assets/home_images/washing-machine.png";
      //
    } else if (number_service == 2) {
      image = "assets/home_images/dry.png";
    } else if (number_service == 3) {
      image = "assets/home_images/shoe.png";
    } else if (number_service == 4) {
      image = "assets/home_images/clean.png";
    }

    return InkWell(
      onTap: () {
       navigateto_page(context, Detailes());
            
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          color: Colors.white,
          width: width_and_height_box,
          height: width_and_height_box,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(image),
              SizedBox(
                height: 15,
              ),
              Text("$name_service")
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Home Page"),
      ),
      body: Column(
        children: [
          Container(
            height: 370.0,
            child: Stack(
              alignment: AlignmentDirectional.bottomCenter,
              children: [
                Align(
                  alignment: AlignmentDirectional.topCenter,
                  child: Container(
                    width: double.infinity,
                    height: 300,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Color(0xff40dedf), Color(0xff0fb2ea)],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 20,
                  top: 50,
                  height: 60,
                  width: 60,
                  child: Image.asset("assets/home_images/user.png"),
                ),
                Positioned(
                  left: 20,
                  top: 120,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("Hi John",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 32,
                          )),
                      Text(
                          "Get your laundry washed, folded \nand delivered straight to your door.",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          )),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    service(1, "washinga"),
                    SizedBox(
                      width: 20,
                    ),
                    service(2, "Dry Clean "),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              service(3, "Shos "),
              SizedBox(
                width: 20,
              ),
              service(4, "Primum"),
            ],
          ),
        ],
      ),
    );
  }
}
