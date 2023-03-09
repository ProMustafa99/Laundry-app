// ignore_for_file: avoid_single_cascade_in_expression_statements

import 'package:app_settings/app_settings.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Map/Map.dart';
import 'package:flutter_application_1/account%20setting/Account.dart';
import 'package:flutter_application_1/data_mangment/status_app.dart';
import 'package:flutter_application_1/home.dart';
import 'package:flutter_application_1/widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:syncfusion_flutter_maps/maps.dart';

class lundary_cubit extends Cubit<laundry_app> {
  lundary_cubit(super.initialState);
  static lundary_cubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<BottomNavigationBarItem> bottomItems = [
    // ignore: prefer_const_constructors
    BottomNavigationBarItem(
      icon: const Icon(Icons.home),
      label: 'Home',
    ),

    // ignore: prefer_const_constructors
    BottomNavigationBarItem(
      icon: const Icon(
        Icons.account_circle,
      ),
      label: 'Account',
    ),
  ];

  List<Widget> screen = [
    const Home(),
    const Account(),
  ];

  void changBottomNavigationBar(int index) {
    currentIndex = index;
    if (index == 1) {
      const Home();
    }

    if (index == 2) {
      const Account();
    }

    emit(Sussess_Navigation());
  }

// For Map

  ///  services locatoin = enabel /disabel
  // Permition  give permation from user

  late Position cl;

  var lat = 0.0;
  var lon;

  late MapZoomPanBehavior zoomPanBehavior;

  Future getPermtion(context) async {
    emit(Loging_Map());

    bool services;
    LocationPermission per;

    services = await Geolocator.isLocationServiceEnabled();

    per = await Geolocator.checkPermission();

    if (per == LocationPermission.denied) {
      per = await Geolocator.requestPermission();
    }

    if (per == LocationPermission.whileInUse) {
      if (services == false) {
        print("Pleaes Trun on Location");

        AwesomeDialog(
          context: context,
          dialogType: DialogType.error,
          animType: AnimType.rightSlide,
          desc: 'Pleaes Trun on Location',
          btnOkOnPress: () {
            AppSettings.openLocationSettings(callback: () {
              print("****************************");

              print("Done Turn on location");
              // navigateto_page(context , Map_page());

              print("****************************");
            });
          },
        )..show();
      } else {
        get_Location_user();
      }
    }
  }

  // Get Location Users
  Future<void> get_Location_user() async {
    emit(Loging_Map());

    cl = await Geolocator.getCurrentPosition().then((value) => value);

    lat = cl.latitude;
    lon = cl.longitude;

    zoomPanBehavior = MapZoomPanBehavior(
      focalLatLng: MapLatLng(lat, lon),
      zoomLevel: 15,
    );
    emit(Sussess_Map());
  }

  // For Prices page

  String name_services ="";
  int Number_Tshert = 0,
      Number_jens = 0,
      Number_Jaket = 0,
      Number_Shoes = 0,
      Number_Boxer = 0,
      Number_BedCover = 0,
      Number_index = 0;
  double total = 0;

  void Prices(String Status, int Tshert, Jens, Jaket, Shoes, Boxer, BedCover,
      double Total) 
      {
        name_services = Status;
        Number_Tshert = Tshert;
        Number_jens = Jens;
        Number_Jaket = Jaket;
        Number_Shoes = Shoes;
        Number_Boxer = Boxer;
        Number_BedCover = BedCover;
        total = Total;
     }

}



