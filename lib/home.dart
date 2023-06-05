import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_application_1/Detailes/delails_dryclean.dart';
import 'package:flutter_application_1/Detailes/details.dart';
import 'package:flutter_application_1/Detailes/dryclean+washing.dart';
import 'package:flutter_application_1/account%20setting/Account_settings.dart';
import 'package:flutter_application_1/data_mangment/backend_app/cubit_firebase.dart';
import 'package:flutter_application_1/model/home_page_model.dart';
import 'package:flutter_application_1/model/product_info.dart';
import 'package:flutter_application_1/widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'data_mangment/backend_app/status_backend.dart';

int activeindex = 0;

class Home extends StatefulWidget {

  @override
  State<Home> createState() => _homeState();
}

class _homeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 70,
        flexibleSpace: SafeArea(
          child: Padding(
              padding: const EdgeInsets.only(right: 30 ,left: 30 , top: 10),
              child: UserName()
          ),
        ),
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          final EdgeInsets padding = MediaQuery.of(context).padding;
          final double availableWidth = constraints.maxWidth;


          return SingleChildScrollView(
            child: Container(
              width: availableWidth,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  CarouselSlider(
                    items: ItemsSider.map((e) => Padding(
                      padding: EdgeInsets.all(15),
                      child: Container(
                        width: double.infinity,
                        child: ClipRRect(
                          borderRadius:  BorderRadius.circular(20),
                          child: Image(
                              image:AssetImage('${e.image}')
                          ),
                        ),
                      ),
                    )).toList(),
                    options: CarouselOptions(
                      autoPlay: true,
                      viewportFraction: 1.0,
                      reverse: true,
                      enlargeCenterPage: true,
                      padEnds: true,
                      onPageChanged: (index, reason) {
                        setState(() {
                          activeindex = index;
                        });
                      },
                    ),
                  ),
                  const SizedBox(height: 10),
                  bulidIndctor(),
                  const SizedBox(height: 8),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center, //Center Row contents horizontally,
                      crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          navigateto_page(context, Details_dry_clean_washing("غسيل وكوي"));
                        },
                        child: Container(
                           width: MediaQuery.of(context).size.width * 0.4, // Adjust the percentage as needed
                           height: MediaQuery.of(context).size.height * 0.3, // Adjust the percentage as needed
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/home_images/Group 6.png"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Column(
                        children: [
                          InkWell(
                            onTap: () {
                              navigateto_page(context, Detailes("غسيل"));
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width*0.4,
                              height:  MediaQuery.of(context).size.height * 0.14,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage("assets/home_images/Group 8.png"),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          InkWell(
                            onTap: () {
                              navigateto_page(context, Details_dry_clean("كوي"));
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width*0.4,
                              height:  MediaQuery.of(context).size.height * 0.14,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage("assets/home_images/Group 9.png"),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [

                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: BlocProvider(
                    create: (BuildContext context) => get_data_cubit(Loading_get_points())..get_points(),
                    child: BlocConsumer<get_data_cubit, status_get_data>(
                    listener: (context, state) {},
                    builder: (context, state) {
                    double progress = get_data_cubit.get(context).info_points.number / 1000.0;
                    total_point = get_data_cubit.get(context).info_points.number;

                    return  Padding(
                      padding: EdgeInsets.all(15),
                    child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 120,
                    color: Color(0xff499AD4),
                    child: Padding(
                    padding: const EdgeInsets.only(left: 35, right: 35 , top: 20 , bottom: 20),
                    child: Row (
                    children: [

                    Column(
                    children: [
                    Text("نقاطك" ,style: TextStyle(color: Colors.white , fontSize: 25),),
                    Text("${(get_data_cubit.get(context).info_points.number)}/1000 ",style: TextStyle(color: Colors.white , fontSize: 25),)
                    ],
                    ),

                    SizedBox(width: 30,),
                    Container(
                    decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.0),
                    ),
                    child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    // const SizedBox(height: 16.0),
                    Container(
                    width: 80.0,
                    height: 80.0,

                    decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Color(0xff29B6F6), width: 6.0),
                    ),
                    child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: CircularProgressIndicator(
                    value: progress,
                    strokeWidth: 4.0,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    ),
                    ),
                    )
                    ],
                    ),
                    ),


                    ],
                    ),
                    ),
                    ),
                    );
                    }),),
                  ),

                ],
              ),
            ),
          );
        },
      ),
    );
  }
}




String Name  = "";

Widget bulidIndctor() {
  return AnimatedSmoothIndicator(
    activeIndex: activeindex,
    count: ItemsSider.length,
    effect: const ExpandingDotsEffect(
        dotColor: Colors.grey,
        dotHeight: 5, //Determines the height of the point
        dotWidth: 10, //Determines the width of the point
        spacing: 5.0 //It determines the distance between the points

        ),
  );
}

Widget UserName () {
  return BlocProvider(
      create: (BuildContext context) => get_data_cubit(Loading_get_data_user())..get_data_user(),
      child:  BlocConsumer<get_data_cubit, status_get_data>(
          listener: (context, state) {},
          builder: (context, state) {
            Name = get_data_cubit.get(context).Info_user.Name;
            return ConditionalBuilder(
              condition: state is !Loading_get_data_user,

              builder: (context)  {
                return
                  Container(
                    child: Column(
                      children: [
                        Row(

                          children: [

                            CircleAvatar(
                              backgroundColor: Color(0xff499AD4),
                              radius: 22,
                              child: Text(
                                "${Name[0].toUpperCase()}",
                                style: TextStyle(fontSize: 24, color: Colors.white),
                              ),
                            ),

                            SizedBox(width: 15,),

                            Expanded(
                              child: Text(
                                "$Name",
                                style: TextStyle(color: Colors.black),
                              ),
                            ),

                            Spacer(),

                            IconButton(
                                onPressed: () {
                                  navigateto_page(context, AccountSettings());
                                  //AccountSettings
                                },
                                icon: Icon(
                                  Icons.settings,
                                  color: Color(0xff499AD4),
                                ))
                          ],

                        ),
                      ],
                    ),
                  );
              },
              fallback: (context) => Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
      )
  );
}