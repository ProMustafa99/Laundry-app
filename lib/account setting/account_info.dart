import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/data_mangment/backend_app/cubit_firebase.dart';
import 'package:flutter_application_1/data_mangment/backend_app/status_backend.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class account_info extends StatefulWidget {
  const account_info({Key? key}) : super(key: key);

  @override
  State<account_info> createState() => _account_infoState();
}

class _account_infoState extends State<account_info> {
  var fname = TextEditingController();
  var lname = TextEditingController();
  var phone = TextEditingController();
  var _forKey = GlobalKey<FormState>();

  Widget Fname() {

    return Container(
      child: Padding(
        padding: EdgeInsets.all(12),
        child: TextFormField(
          controller: fname,
          maxLength: 20,
          textAlign: TextAlign.end,
          decoration: InputDecoration(
            label: Container (
              width: double.infinity,
              child: Text("الإسم" ,textAlign: TextAlign.end,),
            ),
            hintText: 'Ali',
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'هذا الحقل مطلوب';
            }
          },
        ),
      ),
    );
  }

  Widget Phone() {
    return Container(
      child: Padding(
        padding: EdgeInsets.all(12),
        child: TextFormField(
          keyboardType: TextInputType.phone,
          maxLength: 10,
          textAlign: TextAlign.end,
          controller: phone,
          decoration: InputDecoration(
            label: Container (
              width: double.infinity,
              child: Text("رقم الهاتف" ,textAlign: TextAlign.end,),
            ),
            hintText: '07********',
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'هذا الحقل مطلوب';
            }

            else {
              if (phone.text.length <10) {
                return 'يجب ان يتكون رقم الهاتف من 10 خانات ';
              }
            }
          },
        ),
      ),
    );
  }

  Widget Save_data() {
    return BlocProvider(
      create: (BuildContext context) => get_data_cubit(LoginInitialdata()),
      child: BlocConsumer<get_data_cubit, status_get_data>(
        listener: (context, state) {},
        builder: (context, state) {
          return ConditionalBuilder(
            condition: state is !Loading_change_data,
            builder: (context) {
              return Container(
                width: double.infinity,
                child: RaisedButton(
                  onPressed: () {
                    if (_forKey.currentState!.validate()) {
                      get_data_cubit
                          .get(context)
                          .change_name_phone(context,fname.text, phone.text);
                    }

                  },
                  color: Colors.blue,
                  child: Text(
                    "حفظ التعديلات",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              );
            },
            fallback: (BuildContext context) {
              return Center(child: CircularProgressIndicator());
            },
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>
          get_data_cubit(Loading_get_data_user())..get_data_user(),
      child: BlocConsumer<get_data_cubit, status_get_data>(
          listener: (context, state) {},
          builder: (context, state) {
            fname.text = get_data_cubit.get(context).Info_user.Name;
            lname.text = get_data_cubit.get(context).Info_user.Name;
            phone.text = get_data_cubit.get(context).Info_user.Phone;

            return Scaffold(
                appBar: AppBar(
                  title: Text("المعلومات الأساسية"),
                ),
                body: Padding(
                    padding: const EdgeInsets.all(15),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Container(
                          width: double.infinity,
                          height: double.infinity,
                          color: Colors.white,
                          child: Form(
                            key: _forKey,
                            child: SingleChildScrollView(
                                child: Padding(
                                    padding: const EdgeInsets.all(15),
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.circular(15),
                                        child: Container(
                                            child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Fname(),
                                            Phone(),
                                            SizedBox(
                                              height: 25,
                                            ),

                                            Save_data(),
                                          ],
                                        ))))),
                          )),
                    )));
          }),
    );
  }
}



