import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/data_mangment/backend_app/cubit_firebase.dart';
import 'package:flutter_application_1/data_mangment/backend_app/status_backend.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class PointsPage extends StatefulWidget {
  final int initialPoints;

  PointsPage({this.initialPoints = 0});

  @override
  _PointsPageState createState() => _PointsPageState();
}

class _PointsPageState extends State<PointsPage> {
  GlobalKey<_PointsPageState> _pageKey = GlobalKey<_PointsPageState>();

  void _reloadPage() {
    _pageKey.currentState!.reloadPage();
  }

  void reloadPage() {
    setState(() {});
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black ,size: 25),
        systemOverlayStyle :SystemUiOverlayStyle (
            statusBarColor: Colors.white,
            statusBarIconBrightness: Brightness.dark
        ),
        title: const Text(
          'نقاطي',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: BlocProvider(
        create: (BuildContext context) => get_data_cubit(Loading_get_points())..get_points(),

        child: BlocConsumer<get_data_cubit, status_get_data>(
          listener: (context, state) {},
          builder: (context, state) {
            double progress = get_data_cubit.get(context).info_points.number / 1000.0;

            return Center(
              child: Container(
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(height: 16.0),

                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(16),
                            child: Stack(
                              children: [
                                Center(
                                  child: Container(
                                    width: 150.0,
                                    height: 150.0,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 10.0,
                                      value: progress,
                                      backgroundColor: Colors.grey[300],
                                      valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFF3C79F5)),
                                    ),
                                  ),
                                ),
                                // SizedBox(width: 20,),
                                Padding(
                                  padding: const EdgeInsets.only(top: 60),
                                  child: Center(
                                    child: Text(
                                      '${(get_data_cubit.get(context).info_points.number)}/1000',
                                      style: const TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF3C79F5),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                        ],
                      ),
                    ),
                    SizedBox(height: 40,),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16.0),
                      child: RaisedButton(
                        onPressed: get_data_cubit.get(context).info_points.number ==1000 ?(){
                           get_data_cubit.get(context).change_value_points(0);
                        } :null,
                        color: Color(0xFF3C79F5),
                        textColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: const Text(
                            'احصل على مكافئة نقاطك ',
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,

                            ),
                            textAlign: TextAlign.right,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }

        ),
      ),
    );
  }
}
