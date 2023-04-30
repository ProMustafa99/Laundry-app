
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/data_mangment/backend_app/cubit_firebase.dart';
import 'package:flutter_application_1/data_mangment/backend_app/status_backend.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class order_list extends StatefulWidget {
  const order_list({Key? key}) : super(key: key);

  @override
  State<order_list> createState() => _order_listState();
}

class _order_listState extends State<order_list> {

  Widget Status_order (String Status) {

    Color color_status_order = Colors.red;

    if (Status != "تحت التنفيذ") {

      color_status_order =  Colors.green;

    }




    return Padding(
      padding: const EdgeInsets.only(top: 10 ,bottom: 10),
      child: Text("${Status}",style: TextStyle(color: color_status_order)),
    );
  }

  @override


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('طلباتي'),
      ),
      body: BlocProvider(
        create: (BuildContext context) => get_data_cubit(Loading_get_list_order())..list_order(),
        child: BlocConsumer<get_data_cubit, status_get_data>(
            listener: (context, state) {},
            builder: (context, state) {
              return  StreamBuilder<QuerySnapshot>(
                stream:get_data_cubit.get(context).orders.snapshots(),
                builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError) {
                    return Text('Something went wrong');
                  }

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                        child: CircularProgressIndicator()
                    );
                  }

                  return ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (BuildContext context, int index) {
                      DocumentSnapshot item = snapshot.data!.docs[index];
                      Map<String, dynamic> itemData = item.data() as Map<String, dynamic>;
                      return Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Container(
                          margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                          width: double.infinity,
                          height: 140,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                                bottomLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: Offset(0, 3), // changes position of shadow
                              ),
                            ],
                          ),

                          child: Container(
                            margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                            child: ListTile(
                              title: Padding(
                                padding: const EdgeInsets.only(top:20),
                                child: Row(
                                  children:
                                  [


                                    Text(itemData['وقت الطلب'],  style: TextStyle(
                                        color: Color(0xff2C3E50),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12),),


                                  ],
                                ),
                              ),

                              subtitle: Padding(
                                padding: const EdgeInsets.only(top:  20),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Text('${itemData['القطع']} : عدد القطع ' ,  style: TextStyle(
                                            color: Color(0xff2C3E50),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15),),
                                        Spacer(),
                                        Text('${itemData['المجموع']} JD' ,   style: TextStyle(
                                            color: Color(0xff2C3E50),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15),),
                                      ],
                                    ),

                                    Status_order(itemData["status order"]),
                                  ],
                                ),
                              ),
                              // trailing: Text('\$${itemData['phone']}'),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              );
            }

        )
      )
    );
  }
}




