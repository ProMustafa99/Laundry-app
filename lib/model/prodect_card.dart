import 'package:flutter/material.dart';


class ProductCart with ChangeNotifier {
  Map<String, dynamic> number_of_pieces1 = {};

  void addProduct(Map<String, dynamic> number_of_pieces) {
    number_of_pieces1.addAll(number_of_pieces);
    print(number_of_pieces1);
    notifyListeners();
  }
}