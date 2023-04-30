import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/data_mangment/cubit_app.dart';
import 'package:flutter_application_1/data_mangment/status_app.dart';
import 'package:flutter_application_1/model/product_info.dart';
import 'package:flutter_application_1/order/order_page.dart';
import 'package:flutter_application_1/widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Map<String, dynamic> payment_details1 = {};
class Details_dry_clean extends StatefulWidget {
  String name_service;

  Details_dry_clean(this.name_service);

  @override
  State<Details_dry_clean> createState() => _Details_dry_cleanState(this.name_service);
}

class _Details_dry_cleanState extends State<Details_dry_clean> {

  String name_service;

  _Details_dry_cleanState(this.name_service);




  int point_dryclean =0 ;
  int dryclean_pieces =0;

  @override
  Widget build(BuildContext context) {



    return   Scaffold(
      appBar: AppBar(
        title: const Text('كوي'),
      ),
      body:  ListView.builder(
        itemCount: dataList.length,
        itemBuilder: (context, index) {
          Product product = dataList[index];
          return FadeInDown(
            delay: const Duration(milliseconds: 630),

            child: Container(
              width: double.infinity,
              margin: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3), // changes position of shadow
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
                    const SizedBox(width: 20,),

                    Column(

                      children: [
                        Text(product.title , style: const TextStyle(fontWeight: FontWeight.bold ,fontSize: 12),),
                        const SizedBox(height: 10,),
                        Text("${product.price.toString()} JD" ,  style: const TextStyle(color: Colors.blue),),

                      ],

                    ),
                    const Spacer(),
                    Row(
                      children:
                      [

                        IconButton(
                            onPressed: product.pieces ==0 ? null : (){
                              setState(() {

                                product.pieces  --;
                                Total_pieces = Total_pieces-1;
                                Total_price =Total_price - product.price;
                                payment_details["${product.title}"] = product.pieces;

                                Total_cost = Total_cost - product.cost_prodect;

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
                            icon: const Icon(Icons.remove)

                        ),
                        Text(" ${product.pieces.toString()}"),

                        IconButton(
                            onPressed:   (){
                              setState(() {

                                product.pieces ++;
                                Total_pieces = Total_pieces+1;

                                dryclean_pieces = dryclean_pieces +1;

                                Total_price =Total_price+ product.price;
                                Total_cost = Total_cost + product.cost_prodect;

                                number_of_pieces["${product.title}"+" - ${product.name_service}"] = product.pieces;
                                Image_prodect_info ["image-${product.title}-${index}"] =product.imageUrl;


                                Vbutton = true;

                              });
                            },
                            icon: const Icon(Icons.add)

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
              color: const Color(0xFF3C79F5),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20,top: 15,bottom: 15),
                    child:BlocProvider(
                      create: (BuildContext context) => lundary_cubit(Loging_Info_list_purchases()),

                      child: BlocConsumer<lundary_cubit,laundry_app>(
                        listener: (context, state) {},
                        builder: (context ,state) {
                          return  RaisedButton(
                            onPressed: Vbutton
                                ? ()
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

                            }
                                : null,
                            padding: const EdgeInsets.all(0.0),
                            color: color_button,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 20, right: 20, top: 8 , bottom: 8),
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
                        },
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


//point = المجموع - (مجموع التكاليف )
//

List<Product> dataList = [

  Product (title: "بلوزة" , price: 0.40 ,pieces: 0, cost_prodect: 0.25 ,name_service: 'كوي',imageUrl: "assets/page1/shirt1.png",),

  Product (title: "جينز" , price: 0.40 ,pieces: 0, cost_prodect: 0.25,name_service: 'كوي',imageUrl: "assets/page1/jeans.png" , ),

  Product (title: "قميص" , price: 0.40 ,pieces: 0, cost_prodect: 0.25,  name_service: 'كوي',imageUrl: "assets/page1/shirt.png" ,),

  Product (title: "عباي/جلباب" , price: 0.65 ,pieces: 0 , cost_prodect: 0.50, name_service: 'كوي', imageUrl: "assets/page1/robe.png" ,),

  Product (title: "فستان" , price: 1.75 ,pieces: 0, cost_prodect: 1.50, name_service: 'كوي',imageUrl: "assets/home_images/dress.png" ,),

  Product (title: "بليزر" , price: 1.00 ,pieces: 0, cost_prodect: 0.75,name_service: 'كوي',imageUrl: "assets/page1/blazer.png" ,),

  Product (title: "بدلة" , price: 1.75 ,pieces: 0,cost_prodect: 1.5, name_service: 'كوي',imageUrl: "assets/page1/suit2.png" ,),
];

