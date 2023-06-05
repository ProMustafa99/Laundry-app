
import 'dart:ffi';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/Add%20new%20products.dart';
import 'package:flutter_application_1/Map/Map.dart';
import 'package:flutter_application_1/data_mangment/backend_app/cubit_firebase.dart';
import 'package:flutter_application_1/data_mangment/backend_app/status_backend.dart';
import 'package:flutter_application_1/home.dart';
import 'package:flutter_application_1/model/product_info.dart';
import 'package:flutter_application_1/widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


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

  int point = 0;
  int selectedPoints = 0;

  int offerValue = 0;

  int Remaining_points =total_point;


  Map<String, dynamic> upcoming_orders = {};

  Map<String, dynamic> Prodect_image = {};

  Map<String, dynamic> Payment_details = {};

  void Change_bill_value (double value_offer) {

    if (value_offer > Payment_details["السعر"]) {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.error,
        animType: AnimType.rightSlide,
        desc: 'قيمة الخصم تعدت  قيمة الفاتورة',
        btnOkOnPress: () {},
      ).show();
    }

    else {

      setState(() {
        Remaining_points = Remaining_points - selectedPoints;
        Payment_details["السعر"] = double.parse((Payment_details["السعر"] - value_offer).toStringAsFixed(2));
        Payment_details["المجموع"] = Payment_details["السعر"];
        offerValue = selectedPoints;

        Navigator.of(context).pop();

      });

    }


  }

  _Order_pageState(this.upcoming_orders , this.Prodect_image , this.Payment_details);

  @override
  Widget build(BuildContext context) {

    List<String> keys = upcoming_orders.keys.toList();
    double fontSize = 17;


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

                String keyName = keys[index];

                List<String> parts = keyName.split("-");

                String firstPart = parts[0];
                String secondPart = parts[1];

                String key = upcoming_orders.keys.elementAt(index);

                var value = upcoming_orders[key];

                return ListTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[


                      Text("${value}"),

                      const Spacer(),

                      Column(
                        children: [
                          Text("${firstPart}",style: const TextStyle(fontSize: 18),),
                          Text("${secondPart}"),
                          const Divider(
                            color: Colors.black,
                          ),
                        ],
                      ),


                      const SizedBox(width: 20,),

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

            BlocProvider(
              create: (BuildContext context) => get_data_cubit(Loading_get_points())..get_points(),
              child: BlocConsumer<get_data_cubit , status_get_data>(
                listener: (context , status) {},
                builder: (context , status) {
                   point = get_data_cubit.get(context).info_points.number;

                    return Padding(
                    padding: const EdgeInsets.only(left: 10 , right: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children:
                      [
                        const Text("ملخص الدفع " ,style: TextStyle(fontSize: 20 , fontWeight: FontWeight.bold),
                          textAlign: TextAlign.right,),

                        const SizedBox(height: 15,),

                        Row(
                          children:
                          [
                            Text("${Payment_details['القطع']}",
                                style: TextStyle(color: const Color(0xff7B7D7D ),fontSize: fontSize) ),
                            const Spacer(),
                            Text("عدد القطع",style: TextStyle(color: const Color(0xff7B7D7D ) ,fontSize: fontSize)),

                          ],
                        ),

                        const SizedBox(height: 15,),

                        Row(
                          children:
                          [
                            Text("${Payment_details['السعر'].toStringAsFixed(2)}",style: TextStyle(color: const Color(0xff7B7D7D ),fontSize: fontSize)),
                            const Spacer(),
                            Text("المجموع", style: TextStyle(color: const Color(0xff7B7D7D ),fontSize: fontSize)),

                          ],
                        ),
                        const SizedBox(height: 15,),

                        Row(
                          children:
                          [
                            Text("${Payment_details['النقاط'].toStringAsFixed(0)}",
                                style: TextStyle(
                                    color: const Color(0xff7B7D7D ),
                                    fontSize: fontSize

                                )),
                            const Spacer(),
                            Row(
                              children: [
                                const Icon(Icons.account_balance_wallet ,color: Color(0xff7B7D7D ),),
                                const SizedBox(width: 8,),
                                Text("نقاط الطلب",
                                    style: TextStyle(
                                        color: const Color(0xff7B7D7D )
                                        ,fontSize: fontSize
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
                                color: const Color(0xff7B7D7D )
                                ,fontSize: fontSize
                            )),
                            const Spacer(),
                            Row(
                              children: [
                                const Icon(Icons.monetization_on ,color: Color(0xff7B7D7D ),),
                                const SizedBox(width: 8,),
                                Text("رسوم التوصيل",
                                    style: TextStyle(
                                        color: const Color(0xff7B7D7D )
                                        ,fontSize: fontSize
                                    )),

                              ],
                            )

                          ],
                        ),

                        const SizedBox(height: 15,),

                        Row(
                          children:
                          [
                            Text("${(Payment_details['المجموع']+1)}"
                              ,style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: fontSize),),
                            const Spacer(),
                            Text("قيمة الطلب" ,style: TextStyle(fontWeight: FontWeight.bold,fontSize: fontSize),),

                          ],
                        ),

                        const SizedBox(height: 15,),

                        RaisedButton(
                            color: const Color(0xff29B6F6),
                            child: const Text(
                              "استخدم نقاطك",
                              style: TextStyle(color: Colors.white),
                            ),

                            onPressed: () {
                              showDialog ( context: context , builder: (BuildContext context) {

                                return StatefulBuilder (


                                    builder: (context, setState) {

                                      int increment = 5;
                                      int steps = (Remaining_points / increment).round();

                                      return AlertDialog (
                                        title: Text('إستبدال النقاط',textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold),),
                                        content: Column (
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            SizedBox(height: 16),


                                            Text("${selectedPoints} تستخدم نقاط " ,style: TextStyle(fontSize: fontSize) ),

                                            SizedBox(height: 16),

                                            Text("${Remaining_points} من أصل ",style: TextStyle(fontSize: fontSize) ),

                                            SizedBox(height: 16),

                                            Slider(
                                              value: selectedPoints.toDouble().clamp(0, Remaining_points.toDouble()),
                                              divisions: steps > 0 ? steps : 1,
                                              label: selectedPoints.round().toString(),
                                              min: 0,
                                              max: Remaining_points > 0 ? Remaining_points.toDouble() : 1,
                                              onChanged: (double value) {
                                                setState(() {
                                                  selectedPoints = value.toInt();
                                                });
                                              },
                                            ),

                                            Text("مقدا الخصم :  ${(selectedPoints /100).toStringAsFixed(2)}"),
                                          ],
                                        ),

                                        actions: [

                                           FlatButton(
                                               color: Colors.red,
                                                  child: const Text('إلغاء',style: TextStyle(color: Colors.white),),
                                                     onPressed: () {
                                                       Navigator.of(context).pop();
                                                       },
                                            ),

                                           FlatButton(
                                            color:  const Color(0xff29B6F6),
                                            child: const Text('حفظ',style: TextStyle(color: Colors.white),),
                                            onPressed: () {
                                              setState(() {

                                                if (Remaining_points <=0) {
                                                AwesomeDialog(
                                                context: context,
                                                dialogType: DialogType.info,
                                                animType: AnimType.rightSlide,
                                                title: 'تحذير ',
                                                desc: 'لقد نفذت نقاطك',
                                                btnOkOnPress: () {},
                                                ).show();
                                                }

                                                else  if (Remaining_points < selectedPoints) {
                                                  AwesomeDialog(
                                                    context: context,
                                                    dialogType: DialogType.info,
                                                    animType: AnimType.rightSlide,
                                                    title: 'قيمة النقاط المستخدمة أكبر من قيمة النقاط المتبقية ',
                                                    desc: 'يرجى تقليل عدد النقاط المستخدمة لتكون أقل من عدد النقاط المتبقية',
                                                    btnOkOnPress: () {},
                                                  ).show();
                                                }

                                                else {

                                                  Change_bill_value (selectedPoints/100);
                                                }

                                              });
                                            },
                                          ),

                                        ],

                                      );

                                    }

                                );

                              }

                              );
                            }

                        ),

                      ],
                    ),
                  );
                },

              ),
            ),


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

                          navigateto_page(context , Map_page(Payment_details ,upcoming_orders ,offerValue.toInt()));
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
                    const Spacer(),

                    Container(

                      child:  RaisedButton(
                        onPressed: ()
                        {
                          navigateto_page(context , AddNewProducts());
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




