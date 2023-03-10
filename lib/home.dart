import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_application_1/Detailes/delails_dryclean.dart';
import 'package:flutter_application_1/Detailes/details.dart';
import 'package:flutter_application_1/model/home_page_model.dart';
import 'package:flutter_application_1/widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';

int activeindex = 0;

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _homeState();
}

class _homeState extends State<Home> {
  Widget conatant(int numsber_contant, String Name_contant) {
    String image = "";
    Color color = const Color(0xFF29B6F6);


    if (numsber_contant == 1) {
      setState(() {
        image = "assets/home_images/washer_ma.gif";
        color = const Color(0xFF29B6F6);
      });
    } 
    
    else if (numsber_contant == 2) {
      setState(() {
        image = "assets/home_images/iron1.gif";

        
        color = const Color(0xFF499AD4);
      });
    }

    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: InkWell(

          onTap: () {
            if (numsber_contant == 1) {
              navigateto_page(context, Detailes("غسيل"));
            }

            else if (numsber_contant == 2) {
              navigateto_page(context, Details_dry_clean("دراي كلين"));
            }
          },
          child: Container(
            color: color,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Image.asset(image),
                  const Spacer(),
                  Text(
                    "${Name_contant}",
                    style: const TextStyle(color: Colors.white, fontSize: 20),
                  )
                ],
              ),
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
          backgroundColor: const Color(0xFF3C79F5),
          title: const Text(
            "Home",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(25.0),
              bottomRight: const Radius.circular(25.0),
              topLeft: Radius.circular(15.0),
              topRight: Radius.circular(15.0)

            ),
            child: Container(
                color: Colors.white,
                width: double.infinity,
                height: double.infinity,
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
                    const SizedBox(
                      height: 15,
                    ),
                    conatant(1, "غسيل"),
                    conatant(2, "دراي كلين"),
                  ],
                )),
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
