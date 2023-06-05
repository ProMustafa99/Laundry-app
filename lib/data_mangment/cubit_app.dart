
import 'package:app_settings/app_settings.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/data_mangment/status_app.dart';
import 'package:flutter_application_1/home.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:location/location.dart';
import 'package:syncfusion_flutter_maps/maps.dart';

class lundary_cubit extends Cubit<laundry_app> {
  lundary_cubit(super.initialState);
  static lundary_cubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<BottomNavigationBarItem> bottomItems = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'الرئيسية',
    ),

    // ignore: prefer_const_constructors
    BottomNavigationBarItem(
      icon: const Icon(
        Icons.account_circle,
      ),
      label: 'حسابك',
    ),
  ];

  List<Widget> screen = [
     Home(),
  ];

  void changBottomNavigationBar(int index) {
    currentIndex = index;
    if (index == 1) {
       Home();
    }

    emit(Sussess_Navigation());
  }

// For Map

  ///  services locatoin = enabel /disabel
  // Permition  give permation from user

  late Position cl;

  var lat = 0.0;
  var lon;



  bool send_location = false;

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

        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(

              title: const Text("تحذير ",textAlign: TextAlign.center,),
              content: const Text("تعذر تحديد موقعك الحالي الرجاء الذهاب الى الإعدادت وتفعيل الموقع",
                textAlign: TextAlign.center,),
              actions: [
                TextButton(
                  child: Text("لا شكرا"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                TextButton(
                  child: Text("الذهاب الى الإعدادات"),
                  onPressed: () {
                        AppSettings.openLocationSettings(callback: () {

                        }).then((value) async {
                          get_Location_user();
                          send_location = true;
                          Navigator.of(context).pop();

                        }).catchError((error) {

                        });
                  },
                ),
              ],
            );
          },
        );
      }

      else {
        get_Location_user();

      }
    }
  }

  // Get Location Users
  Future<void> get_Location_user() async {

    cl = await Geolocator.getCurrentPosition().then((value) => value);
    lat = cl.latitude;
    lon = cl.longitude;
    send_location = true;
    zoomPanBehavior = MapZoomPanBehavior(
      focalLatLng: MapLatLng(lat, lon),
      zoomLevel: 15,
    );
    emit(Sussess_Map());
  }





  Map<String, dynamic> Order_details = {};
  Map<String, dynamic> Paymant = {};

  int points =0;


  void shopping_basket (Map<String, dynamic> All_details ) {

    emit(Loging_Info_list_purchases());

    Order_details = All_details;


    emit(Sussess_Info_list_purchases());
  }


}



