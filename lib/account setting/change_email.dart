import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/data_mangment/backend_app/cubit_firebase.dart';
import 'package:flutter_application_1/data_mangment/backend_app/status_backend.dart';
import 'package:flutter_application_1/login/login-page.dart';
import 'package:flutter_application_1/widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Change_email extends StatefulWidget {
  const Change_email({Key? key}) : super(key: key);

  @override
  State<Change_email> createState() => _Change_emailState();
}

class _Change_emailState extends State<Change_email> {
  Widget password_function() {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Container(
        width: double.infinity,
        height: 60,
        child: TextFormField(
          controller: password,
          obscureText: Show_password,
          decoration: InputDecoration(
            hintText: 'كلمة المرور ',
            suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    Show_password = !Show_password;
                  });
                },
                icon: Icon(
                    Show_password ? Icons.visibility_off : Icons.visibility)),
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
      create: (BuildContext context) => get_data_cubit(Loading_change_data()),
      child: BlocConsumer<get_data_cubit, status_get_data>(
        listener: (context, state) {},
        builder: (context, state) {
          return ConditionalBuilder(
            condition: state is Loading_change_data,
            builder: (context) {
              return Padding(
                padding: const EdgeInsets.all(12),
                child: Container(
                  width: double.infinity,
                  child: RaisedButton(
                    onPressed: () {
                      if (_forKey.currentState!.validate()) {
                        if (last_password != password.text) {
                          Tosta_mes(
                              mess: "كلمة السر غير صحيحة", color: Colors.red);
                        } else {
                          get_data_cubit
                              .get(context)
                              .change_email(context, new_email.text);
                        }
                      }
                    },
                    color: Colors.blue,
                    child: Text(
                      "حفظ البيانات",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
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
            last_email.text = get_data_cubit.get(context).Info_user.Email;
            last_password = get_data_cubit.get(context).Info_user.Password;

            return Scaffold(
                appBar: AppBar(
                  title: Text("Change Email "),
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

var last_email = TextEditingController();
var new_email = TextEditingController();
var password = TextEditingController();

var last_password;

bool Show_password = true;
var _forKey = GlobalKey<FormState>();

Widget LastEmail() {
  return Container(
    child: Padding(
      padding: EdgeInsets.all(12),
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
      padding: EdgeInsets.all(12),
      child: TextFormField(
        controller: new_email,
        // ignore: prefer_const_constructors
        decoration: InputDecoration(
          labelText: "البريد الإلكتروني",
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

//                   padding: EdgeInsets.all(12),
//                   child: Container(
//                     width: double.infinity,
//                     child: RaisedButton(
//                       onPressed: () {
//                         if (_forKey.currentState!.validate()) {
//                           print("//////////////////////////////////");
//                           print("Done Save Data");
//                           print("//////////////////////////////////");
//                         }
//                       },
//                       child: Text(
//                         "Submit",
//                         style: TextStyle(color: Colors.white),
//                       ),
//                       color: Colors.blue,
//                     ),
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),