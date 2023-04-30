import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/data_mangment/backend_app/cubit_firebase.dart';
import 'package:flutter_application_1/data_mangment/backend_app/status_backend.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Change_email extends StatefulWidget {
  const Change_email({Key? key}) : super(key: key);

  @override
  State<Change_email> createState() => _Change_emailState();
}

class _Change_emailState extends State<Change_email> {

  var last_email = TextEditingController();
  var new_email = TextEditingController();
  var password = TextEditingController();


  bool Show_password = true;
  var _forKey = GlobalKey<FormState>();

  Widget LastEmail() {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: TextFormField(
          enableInteractiveSelection: false,
          enabled: false,
          controller: last_email,
          // ignore: prefer_const_constructors
          decoration: InputDecoration(),
        ),
      ),
    );
  }

  Widget New_Email() {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: TextFormField(
          textAlign: TextAlign.end,
          controller: new_email,
          // ignore: prefer_const_constructors
          decoration: InputDecoration(
            label: Container (
              width: double.infinity,
              child: Text("البريد الإلكتروني" ,textAlign: TextAlign.end,),
            ),
            hintText: 'example@example.com ',
          ),
          validator: (value) {
            RegExp regex = RegExp(r'^(?=.*?[.])(?=.*?[@])(?=.*?[com]).{8,}$');
            if (value == null || value.isEmpty) {
              return 'الرجاء إدخال البريد الالكتروني';
            } else if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
              return "صيغة البريد الإلكتروني خاظئة";
            }
          },
        ),
      ),
    );
  }

  Widget password_function() {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Container(
        width: double.infinity,
        height: 60,
        child: TextFormField(
          controller: password,
          obscureText: Show_password,
          textAlign: TextAlign.end,
          decoration: InputDecoration(
            label:Container (
              width: double.infinity,
              child: Text("كلمة المرور" ,textAlign: TextAlign.end,),
            ),
            hintText: 'كلمة المرور ',

              prefixIcon :IconButton(
                  onPressed: () {
                    setState(() {
                      Show_password = !Show_password;
                    });
                  },

                  icon: Icon(
                      Show_password ? Icons.visibility_off : Icons.visibility)
              )
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'الرجاء إدخال كلمة المرور الحالية ';
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
              return Padding(
                padding: const EdgeInsets.all(12),
                child: Container(
                  width: double.infinity,
                  child: RaisedButton(
                    onPressed: () {
                      if (_forKey.currentState!.validate()) {
                        get_data_cubit.get(context).change_email(context, new_email.text.trim() ,password.text.trim());
                      }
                    },
                    color: Colors.blue,
                    child: const Text(
                      "حفظ التعديلات",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                ),
              );
            },
            fallback: (BuildContext context) {
              return Center(child: const CircularProgressIndicator());
            },
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => get_data_cubit(Loading_get_data_user())..get_data_user(),
      child: BlocConsumer<get_data_cubit, status_get_data>(
          listener: (context, state) {},
          builder: (context, state) {
            last_email.text = get_data_cubit.get(context).Info_user.Email;

            return Scaffold(
                appBar: AppBar(
                  title: const Text("تغير البريد الإلكتروني"),
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
                                  child: Container(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        LastEmail(),
                                        New_Email(),
                                        password_function(),
                                        Save_data(),
                                        // ignore: prefer_const_constructors
                                        SizedBox(
                                          height: 25,
                                        ),
                                      ],
                                    ),
                                  ),
                                ))))));
          }),
    );
  }
}


