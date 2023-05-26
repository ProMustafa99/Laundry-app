

// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Color color_background = Color(0xFF3C79F5);


ThemeData light = ThemeData(
  
  primarySwatch: Colors.blue,
  appBarTheme: const AppBarTheme(
      backwardsCompatibility: false,
      systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark
      ),
      backgroundColor: Colors.white,
      titleTextStyle: TextStyle(
          // color: Colors.white ,
          fontSize: 20,
          fontWeight: FontWeight.bold),
      iconTheme: IconThemeData(color: Colors.black ,size: 25),
      elevation: 0.0,
      centerTitle: true
  ),
  scaffoldBackgroundColor: Colors.white,
  
  // ignore: prefer_const_constructors
  bottomNavigationBarTheme:BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: color_background,
      elevation: 40.0,
      backgroundColor: Colors.white

  ),
  textTheme:TextTheme
    (
      bodyText1: TextStyle(fontSize: 18, fontWeight: FontWeight.w600 ,color: Colors.black),
      bodyText2: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black )

  ),
);


ThemeData dark = ThemeData(
  // primarySwatch: Colors.grey,
  // primaryColor: Colors.black,
  // brightness: Brightness.dark,
  // backgroundColor: const Color(0xFF212121),
  // accentColor: Colors.white,
  // accentIconTheme: IconThemeData(color: Colors.black),
  // dividerColor: Colors.black12,
);


