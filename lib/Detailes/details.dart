
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/data_mangment/cubit_app.dart';
import 'package:flutter_application_1/data_mangment/status_app.dart';

import 'package:flutter_application_1/model/product_info.dart';
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


  int point_washing =0 ;

  int washing_pieces =0;

  double sum =0 ;

  @override
  Widget build(BuildContext context) {


    return   Scaffold(
      appBar: AppBar(
        title: Text('غسيل'),
      ),
      body:  ListView.builder(
        itemCount: dataList.length,
        itemBuilder: (context, index) {
          Product product = dataList[index];

          return FadeInDown(
            delay: Duration(milliseconds: 330),

            child: Container(
              width: double.infinity,
              margin: const EdgeInsets.all(12),
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
              child: ListTile(

                title: Row(
                  children:
                  [
                    Container(
                        margin: const EdgeInsets.all(10),
                        width: 60,
                        height: 60,

                        child: Row(
                          children:
                          [
                            Image.asset(product.imageUrl),
                          ],
                        )
                    ),

                    SizedBox(width: 10,),

                    Column(

                      children: [
                        Text(product.title , style: TextStyle(fontWeight: FontWeight.bold ,fontSize: 12),),
                        SizedBox(height: 10,),
                        Text("${product.price.toString()} JD" ,  style: TextStyle(color: Colors.blue),),

                      ],

                    ),
                    Spacer(),
                    Row(
                      children:
                      [

                        IconButton(
                            onPressed: product.pieces ==0 ? null : (){
                              setState(() {

                                product.pieces  --;

                                Total_pieces = Total_pieces-1;


                                washing_pieces = Total_pieces;

                                Total_price =Total_price - product.price;


                                print(Total_cost);

                                Total_cost = Total_cost - product.cost_prodect;

                                print(Total_cost);

                                payment_details["${product.title}"] = product.pieces;
                                number_of_pieces["${product.title}"+" - ${product.name_service}"] = product.pieces;


                                if (Total_pieces==0) {
                                  Total_pieces = 0;
                                  Vbutton = false;
                                }

                                if (payment_details["${product.title}"] ==0) {
                                    payment_details.remove("${product.title}");
                                    number_of_pieces.remove("${product.title}"+" - ${product.name_service}");
                                    Image_prodect_info.remove("image-${index}");
                                }

                              });
                            },
                            icon: Icon(Icons.remove)

                        ),
                        Text(" ${product.pieces}"),

                        BlocProvider(
                          create: (BuildContext context) => lundary_cubit(Loging_Info_list_purchases()),

                          child: BlocConsumer<lundary_cubit,laundry_app>(
                            listener: (context, state) {},
                            builder: (context ,state) {
                              return IconButton(
                                  onPressed:   (){
                                    setState(() {

                                      product.pieces ++;

                                      Total_pieces = Total_pieces+1;

                                      Total_price =Total_price+ product.price;

                                      Total_cost = Total_cost + product.cost_prodect;

                                      print(Total_cost);

                                      Image_prodect_info ["image-${product.title}-${index}"] =product.imageUrl;

                                      number_of_pieces["${product.title}"+" - ${product.name_service}"] = product.pieces;


                                      Vbutton = true;
                                    });
                                  },
                                  icon: Icon(Icons.add)

                              );
                            }

                          ),
                        )
                      ],
                    ),
                  ],
                ),

              ),
            ),
          );
        },
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
                    padding: EdgeInsets.only(left: 20, right: 20,top: 15 , bottom: 15),
                    child: BlocProvider(
                      create: (BuildContext context) => lundary_cubit(Loging_Info_list_purchases()),


                      child: BlocConsumer<lundary_cubit,laundry_app>(
                        listener: (context, state) {},
                         builder: (context ,state) {
                          return RaisedButton(
                            onPressed: Vbutton ? ()
                            {


                              Points  = (Total_price - Total_cost)*20;


                              payment_details['المجموع'] =double.parse(Total_price.toStringAsFixed(2));

                              payment_details['السعر'] =Total_price.toStringAsFixed(2);

                              payment_details['القطع'] =Total_pieces.toString();

                              payment_details['النقاط']= double.parse(Points.toStringAsFixed(0));

                              lundary_cubit.get(context).shopping_basket(number_of_pieces);

                              navigateto_page(context, Order_page(
                                  lundary_cubit.get(context).Order_details ,
                                  Image_prodect_info,
                                  payment_details

                              ));

                            } : null,

                            padding: const EdgeInsets.all(0.0),
                            color: color_button,
                            child: Padding(
                              padding: EdgeInsets.only(left: 20, right: 20, bottom: 8, top: 8),
                              child: Row(

                                children: [

                                  Text(
                                    "${Total_price.toStringAsFixed(2)} JD",
                                    style:
                                    const TextStyle(fontSize: 20, color: Colors.white),
                                  ),

                                  const Spacer(),

                                  Row(
                                    children: [
                                      const Text(
                                        "إطلع على سلة غسيلك",
                                        style:
                                        TextStyle(fontSize: 18, color: Colors.white),
                                      ),
                                      const SizedBox(
                                        width: 14,
                                      ),
                                      Text(
                                        "${Total_pieces}",
                                        style:
                                        const TextStyle(fontSize: 20, color: Colors.white),
                                      ),
                                    ],

                                  ),

                                ],
                              ),
                            ),
                          );
                         }

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

List<Product> dataList = [

  Product (title: "بجامة" , price: 0.70 ,pieces: 0, cost_prodect: 0.5 ,name_service: 'غسيل', imageUrl: "assets/page1/pagama.png",),

  Product (title: "بنطلون رياضة" , price: 0.35 , cost_prodect: 0.25 ,pieces: 0, name_service: 'غسيل',imageUrl: "assets/page1/sweatpants.png" ,),

  Product (title: "بلوزة" , price: 0.35 , cost_prodect: 0.25 ,pieces: 0,name_service: 'غسيل',imageUrl: "assets/page1/shirt1.png" ,),

  Product (title: "شرط" , price: 0.35 , cost_prodect: 0.25 ,pieces: 0,name_service: 'غسيل',imageUrl: "assets/page1/shorts.png" ,),

  Product (title: "ملابس داخلية" , price: 0.75 ,cost_prodect: 0.5 ,pieces: 0,name_service: 'غسيل',imageUrl: "assets/page1/underwear.png" ,),

  Product (title: "جاكيت" , price: 1.00 , cost_prodect: 0.75 ,pieces: 0,name_service: 'غسيل',imageUrl: "assets/page1/jacket.png" ,),

  //Product (title: "جوارب" , price: 0.0 ,pieces: 0,name_service: 'غسيل',imageUrl: "assets/page1/socks.png" ,),

  Product (title: "حرام" , price: 3 ,cost_prodect: 2.5 ,pieces: 0,name_service: 'غسيل',imageUrl: "assets/page1/bed-sheets.png" ,),

  Product (title: "شرشف" , price: 0.85 , cost_prodect: 0.65 ,pieces: 0,name_service: 'غسيل',imageUrl: "assets/page1/blanket.png" ,),

];

