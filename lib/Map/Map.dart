import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/data_mangment/backend_app/cubit_firebase.dart';
import 'package:flutter_application_1/data_mangment/backend_app/status_backend.dart';
import 'package:flutter_application_1/data_mangment/cubit_app.dart';
import 'package:flutter_application_1/data_mangment/status_app.dart';
import 'package:flutter_application_1/layout.dart';
import 'package:flutter_application_1/widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_maps/maps.dart';
import 'package:intl/intl.dart';


class Map_page extends StatefulWidget {

  Map<String, dynamic> order_details = {};

  Map<String, dynamic> number_of_pices_details = {};


  Map_page(this.order_details ,this.number_of_pices_details);

  @override
  State<Map_page> createState() => _MapState( order_details,number_of_pices_details);
}

class _MapState extends State<Map_page> {

   Map<String,   dynamic> order_details = {};
   Map<String, dynamic> number_of_pices_details = {};


  _MapState(this.order_details ,this.number_of_pices_details);

  Widget Send_order() {
    return BlocProvider(
      create: (BuildContext context) => get_data_cubit(Loading_send_order())..get_points(),
      child: BlocConsumer<get_data_cubit, status_get_data>(
        listener: (context, state) {},
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
            child: RaisedButton(

              onPressed: lundary_cubit.get(context).send_location ? () {

                AwesomeDialog(
                  context: context,
                  dialogType: DialogType.success,
                  animType: AnimType.rightSlide,
                  desc: 'تم طلبك بنجاح ',
                  btnOkOnPress: () {
                    navigateto_and_push(context,layout());

                  },
                )..show();

                order_details["وقت الطلب"] =DateFormat('M/d/y').add_jm().format(DateTime.now());
                order_details["status order"] ="تحت التنفيذ";

                order_details.addAll(number_of_pices_details);
                get_data_cubit.get(context).order_user(order_details);
                int new_point =  order_details["النقاط"];
                int point = new_point + get_data_cubit.get(context).info_points.number;
                get_data_cubit.get(context).change_value_points(point);

                print(order_details);
              } :null,
              child: const Text(
                "إرسال الطلب",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),

              color: Colors.blue,
            ),
          );
        },
      ),
    );
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
                title: Text('الموقع'),
              ),
              body: lundary_cubit.get(context).lat == 0.0 ? Center(

                      child: Container(
                        width: double.infinity,
                        height: 800,
                        child: SfMaps(
                          layers: [
                            MapTileLayer(
                              urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                              zoomPanBehavior: MapZoomPanBehavior(
                                focalLatLng: MapLatLng(30.191982, 35.728211),
                                zoomLevel: 5,


                              ),

                            )
                          ],
                        ),
                      ),
                    )
                  : Container(
                      width: double.infinity,
                      height: 800,
                      child: SfMaps(
                        layers: [
                          MapTileLayer(
                            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                            zoomPanBehavior: lundary_cubit.get(context).zoomPanBehavior,
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
                child: Send_order(),
              ),
            );
          }),
    );
  }
}
