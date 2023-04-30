import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_application_1/Detailes/delails_dryclean.dart';
import 'package:flutter_application_1/Detailes/details.dart';
import 'package:flutter_application_1/Detailes/dryclean+washing.dart';
import 'package:flutter_application_1/model/home_page_model.dart';
import 'package:flutter_application_1/widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

int activeindex = 0;

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _homeState();
}

class _homeState extends State<Home> {
  Widget conatant(int numsber_contant, String Name_contant) {
    String image = "";

    if (numsber_contant == 1) {
      setState(() {
        image = "assets/home_images/washing-machine.png";
      });
    } 
    
    else if (numsber_contant == 2) {
      setState(() {
        image = "assets/home_images/ironing.png";
      });
    }

    else if (numsber_contant == 3) {
      setState(() {
        image = "assets/home_images/clothes-line.png";
      });
    }
    return Padding(
      padding: const EdgeInsets.only(left: 40, top: 40),
      child: ClipRRect(
        child: InkWell(

          onTap: () {

            if (numsber_contant == 1) {
              navigateto_page(context, Detailes("غسيل"));
            }

            else if (numsber_contant == 2) {
              navigateto_page(context, Details_dry_clean("كوي"));
            }

            else if (numsber_contant == 3) {
              navigateto_page(context, Details_dry_clean_washing("غسيل وكوي"));
            }
          },
          child: Container(
            // color: color,
            child:  Column(
              children:
              [
                Image.asset('${image}' ,width: 90, height: 80,),
                SizedBox(height: 18,),
                Text('${Name_contant}', style: TextStyle(fontSize: 17),),

              ],
            ),
          ),
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFF3C79F5),
        appBar: AppBar(
          automaticallyImplyLeading: false, // Set to false to remove back icon

          backgroundColor: const Color(0xFF3C79F5),
          title: const Text(
            "الرئيسية",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(25.0),
              bottomRight: Radius.circular(25.0),
              topLeft: Radius.circular(15.0),
              topRight: Radius.circular(15.0)

            ),
            child:  Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: Colors.white,
              child: Column(
                children: [
                  CarouselSlider(
                    items: ItemsSider.map((e) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: double.infinity,
                        child: ClipRRect(
                          borderRadius:  BorderRadius.circular(20),
                          child: Image(
                            image: NetworkImage('${e.image}'),
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
                  const SizedBox(
                    height: 15,
                  ),

                  bulidIndctor(),

                  Expanded(
                    child: Row(

                      children: [
                        conatant(1 , "غسيل"),
                        const SizedBox(width: 25,),
                        conatant(2, "كوي"),
                      ],
                    ),
                  ),

                  Expanded(
                    child: Row(
                      children: [
                        conatant(3 ,  "كوي+غسيل"),
                      ],
                    ),
                  ),
                ],
              ),
            ),

          ),
        ));
  }
}

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
