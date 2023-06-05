import 'package:flutter/material.dart';

class Product {
  final String imageUrl;
  final String title;
  final String name_service;
  final double price;
  final double cost_prodect ;
  int pieces;


  Product({

    required this.title,
    required this.pieces,
    required this.price,
    required this.cost_prodect,
    required this.name_service,
    required this.imageUrl,});
}


Map<String, dynamic> number_of_pieces = {};

Map<String, dynamic> payment_details = {};

Map<String, dynamic> Image_prodect_info = {};

int Total_pieces =0; // number of pieces for prodect


double Total_cost =0; // Total cost per piece

double  Total_price =0 ; // Total order

int total_point =0;

bool Vbutton = false;

Color color_button = Colors.blue;


double Points =0;




