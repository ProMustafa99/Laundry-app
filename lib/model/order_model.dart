import 'package:flutter/material.dart';

class Info_order {
  String name_services;
  int Tshert;
  int jens;
  int Jaket;
  int Shoes;
  int Boxer;
  int BedCover;
  double total;

  Info_order(
      {required this.name_services,
      required this.Tshert,
      required this.jens,
      required this.Jaket,
      required this.Shoes,
      required this.Boxer,
      required this.BedCover,
      required this.total});
}



List<Info_order> order = [];

void r(
  String name_services,
  int Tshert,
  int jens,
  int Jaket,
  int Shoes,
  int Boxer,
  int BedCover,
  int index,
  double total,
) 

{
  order.add(Info_order(
      name_services: name_services,
      Tshert: Tshert,
      jens: jens,
      Jaket: Jaket,
      Shoes: Shoes,
      Boxer: Boxer,
      BedCover: BedCover, 
      total:total ,
      
      ));
}
