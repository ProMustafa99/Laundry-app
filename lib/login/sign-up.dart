import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/data_mangment/backend_app/cubit_firebase.dart';
import 'package:flutter_application_1/data_mangment/backend_app/status_backend.dart';
import 'package:flutter_application_1/widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Sing_Up extends StatefulWidget {
  const Sing_Up({Key? key}) : super(key: key);

  @override
  State<Sing_Up> createState() => _Sing_UpState();
}

class _Sing_UpState extends State<Sing_Up> {
  Widget button_sign_up() {
    return BlocProvider(
        create: (BuildContext context) => get_data_cubit(LoginInitialdata()),
        child: BlocConsumer<get_data_cubit, status_get_data>(
            listener: (context, state) {},
            builder: (context, state) {
              return ConditionalBuilder(
                condition: state is! Loading_data,
                builder: (context) {
                  return Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Container(
                      width: 600,
                      height: 50,
                      child: RaisedButton(
                        onPressed: () {
                          if (_forKey.currentState!.validate()) {
                            if (password.text == re_password.text) {
                              get_data_cubit.get(context).Create_new_account(
                                  context,
                                  name.text.trim(),
                                  email.text.trim(),
                                  password.text.trim(),
                                  phone_number.text.trim());
                            } else {
                              Tosta_mes(mess: "كلمة السر غير متطابقة");
                            }
                          }
                        },
                        child: Text(
                          "Login",
                          style: TextStyle(fontSize: 25, color: Colors.white),
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0)),
                      ),
                    ),
                  );
                },
                fallback: (BuildContext context) {
                  return CircularProgressIndicator();
                },
              );
            }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          // backgroundColor: Colors.white,
          // iconTheme: IconThemeData(color: Colors.black ,size: 25),
          ),
      body: Form(
        key: _forKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Text(
                  "Sign Up",
                  style: TextStyle(color: Color(0xFF3C79F5), fontSize: 30),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Name(),
              Email(),
              Phone(),
              passowrd(),
              re_passowrd(),
              button_sign_up()
            ],
          ),
        ),
      ),
    );
  }
}

var name = TextEditingController();
var email = TextEditingController();
var password = TextEditingController();
var phone_number = TextEditingController();

var re_password = TextEditingController();
var _forKey = GlobalKey<FormState>();

Widget Name() {
  return Container(
    child: Padding(
      padding: EdgeInsets.all(12),
      child: TextFormField(
        controller: name,
        // ignore: prefer_const_constructors
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: "Name",
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'الرجاء إدخال الاسم ';
          }
        },
      ),
    ),
  );
}

Widget Email() {
  return Container(
    child: Padding(
      padding: EdgeInsets.all(12),
      child: TextFormField(
        controller: email,
        // ignore: prefer_const_constructors
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: "Email",
        ),
        validator: (value) {
          RegExp regex = RegExp(r'^(?=.*?[.])(?=.*?[@])(?=.*?[com]).{8,}$');


          if (value == null || value.isEmpty) {
            return 'الرجاء إدخال البريد الإلكتروني ';
          } else if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
            return "صيغة البريد الإلكتروني خاظئة";
          }
        },
      ),
    ),
  );
}

Widget passowrd() {
  return Container(
    child: Padding(
      padding: EdgeInsets.all(12),
      child: TextFormField(
        controller: password,
        // ignore: prefer_const_constructors
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: "Password",
        ),

        validator: (value) {
          //  RegExp regex = RegExp(
          //     r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');

          RegExp capital_char = RegExp(r'^(?=.*?[A-Z])');

          RegExp smal_char = RegExp(r'^(?=.*?[a-z])');

          RegExp spical_char = RegExp(r'^(?=.*?[!@#\$&*~])');

          RegExp number = RegExp(r'^(?=.*?[0-9])');

          var passNonNullValue = value ?? "";

          if (value == null || value.isEmpty) {
            return 'الرجاء إدخال كلمة المرور ';
          } 
          
          else if (value.length < 7) {
            return 'كلمة المرور قصيرة ';
          } else if (!capital_char.hasMatch(passNonNullValue)) {
            return (" يجب ان تحتوي كلمة المرور على حروف  كبيرة   ");
          } else if (!smal_char.hasMatch(passNonNullValue)) {
            return ("يجب ان تحتوي كلمة المرور على حروف صغيرة");
          } else if (!spical_char.hasMatch(passNonNullValue)) {
            return ("يجب ان تحتوي كلمة المرور على رموز خاصة");
          } else if (!number.hasMatch(passNonNullValue)) {
            return ("يجب ان تحتوي كلمة المرور على ارقام");
          }
        },
      ),
    ),
  );
}

Widget re_passowrd() {
  return Container(
    child: Padding(
      padding: EdgeInsets.all(12),
      child: TextFormField(
        controller: re_password,
        // ignore: prefer_const_constructors
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: "Re password",
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'الرجاء ادخال نفس كلمة المرور الموجودة أعلاه';
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
        controller: phone_number,
        // ignore: prefer_const_constructors
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: "Phone",
          hintText: '07********',
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'الرجاء ادخال رقم الهاتف ';
          }
        },
      ),
    ),
  );
}
