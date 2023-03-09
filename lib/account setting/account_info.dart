import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:dropdown_button2/custom_dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter_application_1/data_mangment/backend_app/cubit_firebase.dart';
import 'package:flutter_application_1/data_mangment/backend_app/status_backend.dart';
import 'package:flutter_application_1/widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class account_info extends StatefulWidget {
  const account_info({Key? key}) : super(key: key);

  @override
  State<account_info> createState() => _account_infoState();
}

class _account_infoState extends State<account_info> {
  Object _selected = "d";

  bool vi = false;

  Widget Save_data() {
    return BlocProvider(
      create: (BuildContext context) => get_data_cubit(Loading_change_data()),
      child: BlocConsumer<get_data_cubit, status_get_data>(
        listener: (context, state) {},
        builder: (context, state) {
          return ConditionalBuilder(
            condition: state is Loading_change_data,
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
                    "حفظ البيانات",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              );
            },
            fallback: (BuildContext context) {
              return CircularProgressIndicator();
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
                  title: Text("Setting Info"),
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

                                            // ignore: prefer_const_constructors
                                            SizedBox(
                                              height: 25,
                                            ),
                                            // ignore: prefer_const_constructors
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(12.0),
                                              // ignore: prefer_const_constructors
                                              child: Text(
                                                "Gender (optional)",
                                                style: TextStyle(
                                                    color: Color(0xffBDC3C7)),
                                              ),
                                            ),

                                            Row(
                                              children: [
                                                Radio(
                                                  value: "d",
                                                  groupValue: _selected,
                                                  onChanged: (value) {
                                                    setState(() {
                                                      _selected = value!;
                                                    });
                                                    print(_selected);
                                                  },
                                                ),
                                                Text("Mail"),
                                                Radio(
                                                  value: "Fmail",
                                                  groupValue: _selected,
                                                  onChanged: (value) {
                                                    setState(() {
                                                      _selected = value!;
                                                    });
                                                  },
                                                ),
                                                Text("Fmail"),
                                              ],
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
        // ignore: prefer_const_constructors
        decoration: InputDecoration(
          labelText: "First name",
          hintText: 'Mustafa ',
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

Widget LName() {
  return Container(
    child: Padding(
      padding: EdgeInsets.all(12),
      child: TextFormField(
        controller: lname,
        // ignore: prefer_const_constructors
        decoration: InputDecoration(
          labelText: "Last name",
          hintText: 'Mustafa ',
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please Enter  Email';
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
        controller: phone,
        // ignore: prefer_const_constructors
        decoration: InputDecoration(
          labelText: "Phone Number",
          hintText: '07********',
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

