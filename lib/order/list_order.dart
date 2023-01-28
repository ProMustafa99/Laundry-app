// ignore_for_file: avoid_single_cascade_in_expression_statements, prefer_const_constructors

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/data_mangment/cubit_app.dart';
import 'package:flutter_application_1/data_mangment/status_app.dart';
import 'package:flutter_application_1/model/order_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class order_list extends StatefulWidget {
  const order_list({Key? key}) : super(key: key);

  @override
  State<order_list> createState() => _order_listState();
}

class _order_listState extends State<order_list> {
  Widget List_Order(int index) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        width: double.infinity,
        height: 140,
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
        child: Container(
          margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  // ignore: prefer_const_constructors
                  Text(
                    "${order[index].name_services}",
                    // ignore: prefer_const_constructors
                    style: TextStyle(
                        color: Color(0xff2C3E50),
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  Spacer(),
                  Text(
                    "27 Nov 2023",
                    style: TextStyle(
                        color: Color(0xff2C3E50), fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Text(
                    "10 Items",
                    style: TextStyle(
                        color: Color(0xff2C3E50), fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  Text(
                    "${order[index].total} JD",
                    style: TextStyle(
                        color: Color(0xff2C3E50), fontWeight: FontWeight.bold),
                  )
                ],
              ),
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
          title: Text("Your Order"),
        ),
        body: ConditionalBuilder(
          condition: order.length > 0,
          builder: (BuildContext context) {
            return SingleChildScrollView(
              child: ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => List_Order(index),
                  separatorBuilder: (context, index) => SizedBox(
                        height: 10.0,
                      ),
                  itemCount: order.length),
            );
          },
          fallback: (BuildContext context) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Container(
                    width: double.infinity,
                    color: Colors.white,
                
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        
                        Image( 
                          image: AssetImage("assets/page1/dry-cleaning.png"),
                          width: 200, 
                          ),

                          SizedBox(
                            height: 30,
                          ),

                        Text("There are no requests yet",style: TextStyle(fontSize: 25),)
                      ],
                
                    ),
                  ),
                ),
              ),
            );
          },
        ));
  }
}
