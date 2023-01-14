import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Account.dart';
import 'package:flutter_application_1/data_mangment/status_app.dart';
import 'package:flutter_application_1/details.dart';
import 'package:flutter_application_1/home.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class lundary_cubit extends Cubit<laundry_app> {
  lundary_cubit(super.initialState);
  static lundary_cubit get(context) => BlocProvider.of(context);


  int currentIndex =0;
   List<BottomNavigationBarItem> bottomItems =[
    BottomNavigationBarItem
      (
      icon: Icon(Icons.home),
      label:'Home',
    ),

    BottomNavigationBarItem
      (
      icon: Icon(Icons.account_circle,),
      label:'Account',
      ),

  ];

  List<Widget> screen=[
    Home(),
    Account(),

  ];

  void changBottomNavigationBar(int index){
    currentIndex = index;
    if(index==1){Home();}

    if(index==2){Account();}

    emit(Sussess_Navigation());
  }




}
