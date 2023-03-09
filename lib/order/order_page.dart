import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/Map/Map.dart';
import 'package:flutter_application_1/widget.dart';

class Order_page extends StatefulWidget {


  Map<String, dynamic> order_details = {};


  Order_page(this.order_details );

  @override
  // ignore: no_logic_in_create_state
  State<Order_page> createState() => _Order_pageState(order_details);
}

class _Order_pageState extends State<Order_page> {


  Map<String, dynamic> order_details = {};

  _Order_pageState(this.order_details);

  double padding_left_right = 15;
  double padding_top = 10;


  Widget List_order_detaiels  () {
    return  Container(
      height: 800,
      child: ListView.separated(

        // shrinkWrap: true,
        // physics: NeverScrollableScrollPhysics(),


        itemCount: order_details.length,

          itemBuilder: (BuildContext context, int index) {
            String key = order_details.keys.elementAt(index);
            var value = order_details[key];
            return ListTile(
              title: Row(
                children: <Widget>[

                  Text("$value" ),
                  Spacer(),
                  Text(key ,style: TextStyle(color: Color(0xff5D6D7E)),
            ),

                ],
              ),
            );
          },

        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(height: 0.0); // adjust this value to reduce the distance between elements
        },

        // separatorBuilder: (context, index) => const SizedBox(height: 1,),


      ),
    );

    }
  @override
  Widget build(BuildContext context) {


    return Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: EdgeInsets.only(left: 15, right: 15),
          
          
          child: SingleChildScrollView(
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
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          "# Mustafa Slamaeh ",
                          style: TextStyle(fontSize: 15),
                        ),
                        const SizedBox(
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

                const SizedBox(height: 20,),

                ClipRRect(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                  ),
                  child: SingleChildScrollView(
                    child: Container(
                        width: double.infinity,
                        color: Colors.white,
                        height: 480,
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15, top: 20, right: 15),
                            child: Column(
                              children: [
                                // Row(
                                //   // ignore: prefer_const_literals_to_create_immutables
                                //   children: [
                                //     Text("$Service", style: TextStyle(color: Color(0xff5D6D7E)),),
                                //     Spacer(),
                                //     Text("الخدمة", style: TextStyle(color: Color(0xff5D6D7E)),),
                                //   ],
                                // ),

                                const SizedBox(
                                  height: 15,
                                ),

                                DottedLine(),

                                Container(
                                    height: 270,
                                    child: List_order_detaiels ()
                                ),
                                //  For Sub Total
                                // Row(
                                //
                                //   children:
                                //   [
                                //     Text("$sub_total", style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xff2C3E50)),),
                                //     Spacer(),
                                //     const Text("السعر", style: TextStyle(color: Color(0xff5D6D7E)),),
                                //   ],
                                // ),

                                const SizedBox(
                                  height: 7,
                                ),

                                // For Delivery
                                // Row(
                                //   // ignore: prefer_const_literals_to_create_immutables
                                //   children:
                                //   [
                                //     Text("1.00 JD", style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xff2C3E50)),),
                                //     Spacer(),
                                //     Text("التوصيل", style: TextStyle(color: Color(0xff5D6D7E)),),
                                //   ],
                                // ),

                                // const SizedBox(
                                //   height: 7,
                                // ),

                                // Toltal
                                // Row(
                                //   // ignore: prefer_const_literals_to_create_immutables
                                //   children:
                                //   [
                                //     Text("$Toltal", style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xff2C3E50)),),
                                //     Spacer(),
                                //     const Text("المجموع", style: TextStyle(color: Color(0xff5D6D7E)),),
                                //   ],
                                // ),

                                Container(
                                  width: double.infinity,
                                  child: RaisedButton(
                                    onPressed: ()
                                    {
                                      navigateto_page(context , Map_page(order_details));
                                    },
                                    color: Colors.blue,
                                    child: Text(
                                      "تأكيد الطلب",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),

                              ],
                            ),
                          ),
                        )),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}




