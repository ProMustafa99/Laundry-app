import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/data_mangment/cubit_app.dart';
import 'package:flutter_application_1/data_mangment/status_app.dart';
import 'package:flutter_application_1/layout.dart';
import 'package:flutter_application_1/widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:syncfusion_flutter_maps/maps.dart';
import 'package:app_settings/app_settings.dart';

class Map_page extends StatefulWidget {
  const Map_page({Key? key}) : super(key: key);

  @override
  State<Map_page> createState() => _MapState();
}

class _MapState extends State<Map_page> {
  var x = 0;

  Future  refresh() async{
    setState(() {
      x = 1;
      print("${x}");
    });
  }

  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      new GlobalKey<RefreshIndicatorState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          lundary_cubit(LoginInitialState_Navigation())..getPermtion(context),
      child: BlocConsumer<lundary_cubit, laundry_app>(
          listener: (context, state) {},
          builder: (context, state) {
            return Scaffold(
              appBar: AppBar(
                title: Text('Map'),
              ),
              body: lundary_cubit.get(context).lat == 0.0
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : Container(
                      width: double.infinity,
                      height: 800,
                      child: SfMaps(
                        layers: [
                          MapTileLayer(
                            urlTemplate:
                                'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                            zoomPanBehavior:
                                lundary_cubit.get(context).zoomPanBehavior,
                            initialMarkersCount: 1,
                            markerBuilder: (BuildContext context, int index) {
                              return MapMarker(
                                latitude: lundary_cubit.get(context).lat,
                                longitude: lundary_cubit.get(context).lon,
                                iconColor: Colors.blue,
                              );
                            },
                          )
                        ],
                      ),
                    ),
              bottomNavigationBar: BottomAppBar(
                //color: Colors.blue,

                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                  child: RaisedButton(
                    onPressed: () {
                      // ignore: avoid_single_cascade_in_expression_statements
                      AwesomeDialog(
                        context: context,
                        dialogType: DialogType.success,
                        animType: AnimType.rightSlide,
                        desc: 'تم طلبك بنجاح ',
                        btnOkOnPress: () {
                          navigateto_and_push(context, layout());
                        },
                      )..show();
                    },
                    // ignore: sort_child_properties_last
                    child: const Text(
                      "Confirm",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    color: Colors.blue,
                  ),
                ),
              ),
            );
          }),
    );
  }
}
