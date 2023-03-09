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

  Map_page(this.order_details);

  @override
  State<Map_page> createState() => _MapState( order_details);
}

class _MapState extends State<Map_page> {

   Map<String,   dynamic> order_details = {};

  _MapState(this.order_details);

  Widget Send_order() {
    return BlocProvider(
      create: (BuildContext context) => get_data_cubit(Loading_send_order()),
      child: BlocConsumer<get_data_cubit, status_get_data>(
        listener: (context, state) {},
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
            child: RaisedButton(
              onPressed: () {
                // ignore: avoid_single_cascade_in_expression_statements
                AwesomeDialog(
                  context: context,
                  dialogType: DialogType.success,
                  animType: AnimType.rightSlide,
                  desc: 'تم طلبك بنجاح ',
                  btnOkOnPress: () {
                    navigateto_and_push(context,layout());
                  },
                )..show();

                order_details["وقت الطلب"] =  DateFormat.yMEd().add_jms().format(DateTime.now());

                get_data_cubit.get(context).order(order_details);
              },
              // ignore: sort_child_properties_last
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
  void initState() {
    // TODO: implement initState
  }

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
                child: Send_order(),
              ),
            );
          }),
    );
  }
}
