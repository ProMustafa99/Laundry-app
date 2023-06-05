
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Detailes/details.dart';
import 'package:flutter_application_1/Detailes/dryclean+washing.dart';
import 'package:flutter_application_1/widget.dart';

import 'Detailes/delails_dryclean.dart';

class AddNewProducts extends StatefulWidget {
  const AddNewProducts({Key? key}) : super(key: key);

  @override
  State<AddNewProducts> createState() => _AddNewProductsState();
}

class _AddNewProductsState extends State<AddNewProducts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar:AppBar(),
      body: Center(
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        final double availableWidth = constraints.maxWidth;
        return SingleChildScrollView(
          child: Container(
            width: availableWidth,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [

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


              ],
            ),
          ),
        );
    },
    ),
      ),
    );
  }
}
