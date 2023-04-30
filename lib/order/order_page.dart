
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/Map/Map.dart';
import 'package:flutter_application_1/layout.dart';
import 'package:flutter_application_1/widget.dart';


class Order_page extends StatefulWidget {

  Map<String, dynamic> upcoming_orders = {};

  Map<String, dynamic> Prodect_image = {};

  Map<String, dynamic> Payment_details = {};

  Order_page(this.upcoming_orders ,this.Prodect_image ,this.Payment_details);

  @override
  State<Order_page> createState() => _Order_pageState(upcoming_orders, Prodect_image,Payment_details);
}

class _Order_pageState extends State<Order_page> {

  double padding_left_right = 15;
  double padding_top = 10;

  Map<String, dynamic> upcoming_orders = {};

  Map<String, dynamic> Prodect_image = {};

  Map<String, dynamic> Payment_details = {};

  _Order_pageState(this.upcoming_orders , this.Prodect_image , this.Payment_details);

  @override
  Widget build(BuildContext context) {

    List<String> keys = upcoming_orders.keys.toList();
    double font_size = 17;


    List<String> images = [];
    Prodect_image.forEach((key, value) {
      images.add(value);
    });


    return Scaffold(
          backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: const IconThemeData(color: Colors.black ,size: 25),
          systemOverlayStyle :const SystemUiOverlayStyle (
              statusBarColor: Colors.white,
              statusBarIconBrightness: Brightness.dark
          ),

          title: const Text(
            'سلة الطلبات ',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body:  Column(
          children: [

            Flexible(

              child:ListView.builder(
              shrinkWrap: true,
              itemCount: keys.length,
              itemBuilder: (BuildContext context, int index) {

                String key_name = keys[index];

                List<String> parts = key_name.split("-");

                String firstPart = parts[0];
                String secondPart = parts[1];

                String key = upcoming_orders.keys.elementAt(index);

                var value = upcoming_orders[key];

                return ListTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[


                      Text("${value}"),

                      Spacer(),

                      Column(
                        children: [
                          Text("${firstPart}",style: TextStyle(fontSize: 18),),
                          Text("${secondPart}"),
                          Divider(
                            color: Colors.black,
                          ),
                        ],
                      ),


                      SizedBox(width: 20,),

                      Container(
                        width: 50,
                        height: 50,
                        child: Image.asset("${images[index]}"),
                      ),

                    ],
                  ),


                );
              },
        )



            ),

            const Divider(),

            Padding(
              padding: const EdgeInsets.only(left: 10 , right: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children:
                [
                    Text("ملخص الدفع " ,style: TextStyle(fontSize: 20 , fontWeight: FontWeight.bold),
                      textAlign: TextAlign.right,),

                        SizedBox(height: 15,),

                       Row(
                    children:
                    [
                      Text(Payment_details['القطع'],
                          style: TextStyle(color: Color(0xff7B7D7D ),fontSize: font_size) ),
                      Spacer(),
                      Text("عدد القطع",style: TextStyle(color: Color(0xff7B7D7D ) ,fontSize: font_size)),

                    ],
                  ),

                       SizedBox(height: 15,),

                       Row(
                        children:
                        [
                          Text(Payment_details['السعر']
                              ,style: TextStyle(color: Color(0xff7B7D7D )
                                  ,fontSize: font_size
                              )),
                          Spacer(),
                          Text("المجموع",
                              style: TextStyle(
                                  color: Color(0xff7B7D7D )
                                  ,fontSize: font_size

                              )),

                        ],
                      ),
                  SizedBox(height: 15,),

                  Row(
                    children:
                    [
                      //Points.toStringAsFixed(0)
                      Text("${Payment_details['النقاط'].toStringAsFixed(0)}",
                          style: TextStyle(
                              color: Color(0xff7B7D7D ),
                              fontSize: font_size

                          )),
                      Spacer(),
                      Row(
                        children: [
                          Icon(Icons.account_balance_wallet ,color: const Color(0xff7B7D7D ),),
                          SizedBox(width: 8,),
                          Text("نقاط الطلب",
                              style: TextStyle(
                                  color: Color(0xff7B7D7D )
                                  ,fontSize: font_size
                              )),

                        ],
                      )

                    ],
                  ),


                      const SizedBox(height: 15,),

                      Row(
                      children:
                      [
                        Text("1" ,style: TextStyle(
                            color: Color(0xff7B7D7D )
                            ,fontSize: font_size
                        )),
                        const Spacer(),
                        Row(
                          children: [
                            Icon(Icons.monetization_on ,color: Color(0xff7B7D7D ),),
                            const SizedBox(width: 8,),
                            Text("رسوم التوصيل",
                                style: TextStyle(
                                    color: Color(0xff7B7D7D )
                                    ,fontSize: font_size
                                )),

                          ],
                        )

                      ],
                    ),

                      SizedBox(height: 15,),

                      Row(
                        children:
                        [
                          Text("${(Payment_details['المجموع']+1)}"
                            ,style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: font_size),),
                          const Spacer(),
                          Text("قيمة الطلب" ,style: TextStyle(fontWeight: FontWeight.bold,fontSize: font_size),),

                        ],
                      )
                ],
              ),
            )

          ],
        ),

        bottomNavigationBar :BottomAppBar (
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row (
                  children: [

                    Container(


                      child:  RaisedButton(
                        onPressed: ()
                        {
                          Payment_details['التوصيل'] = 1;
                          Payment_details['المجموع'] =(Payment_details['المجموع']+1);
                          Payment_details['النقاط'] = (Payment_details['النقاط'].toInt());

                          print(Payment_details['النقاط']);
                          navigateto_page(context , Map_page(Payment_details ,upcoming_orders));
                        },
                        color: Colors.blue,
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "تنفيذ الطلب",
                            style: TextStyle(color: Colors.white,fontSize: 20),
                          ),
                        ),
                      ),

                    ),
                    Spacer(),
                    Container(


                      child:  RaisedButton(
                        onPressed: ()
                        {
                          navigateto_page(context ,layout());
                        },
                        color: Colors.blue,
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "إضافة المزيد ",
                            style: TextStyle(color: Colors.white,fontSize: 20),
                          ),
                        ),
                      ),

                    ),


                  ],
                ),
              ),

            ),
          ),
        )


    );


  }
}




