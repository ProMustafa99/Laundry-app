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

  bool Show_password = true;
  bool re_Show_password = true;

  var name = TextEditingController();
  var email = TextEditingController();
  var password = TextEditingController();
  var phone_number = TextEditingController();

  var re_password = TextEditingController();
  var _forKey = GlobalKey<FormState>();


  Widget Name() {
    return Container(
      child: Padding(
        padding: EdgeInsets.all(8),
        child: TextFormField(
          controller: name,
          textAlign: TextAlign.end,
          maxLength: 20,
          decoration: InputDecoration(

            border: OutlineInputBorder(),
            label: Container (
              width: double.infinity,
              child: Text("الإسم" ,textAlign: TextAlign.end,),
            ),
            hintText: "Ali Ahmmad",
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
        padding: EdgeInsets.all(8),
        child: TextFormField(
          textAlign: TextAlign.end,

          controller: email,
          decoration: InputDecoration(
              border: OutlineInputBorder(),
              label: Container (
                width: double.infinity,
                child: Text("البريد الإلكتروني" ,textAlign: TextAlign.end,),
              ),
              hintText: "exambel@exambel.com"
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
        padding: EdgeInsets.all(8),

        child: TextFormField(
          controller: password,
          textAlign: TextAlign.end,
          obscureText: Show_password,
          decoration: InputDecoration(
              border: OutlineInputBorder(),
              label:Container (
                width: double.infinity,
                child: Text("كلمة المرور" ,textAlign: TextAlign.end,),
              ),
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
        padding: EdgeInsets.all(8),
        child: TextFormField(
          controller: re_password,
          textAlign: TextAlign.end,
          obscureText: re_Show_password,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            label :Container (
              width: double.infinity,
              child: Text("إعادة كلمة المرور" ,textAlign: TextAlign.end,),
            ),

              prefixIcon :IconButton(
                  onPressed: () {
                    setState(() {
                      re_Show_password = !re_Show_password;
                    });
                  },

                  icon: Icon(
                      re_Show_password ? Icons.visibility_off : Icons.visibility)
              )
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
        padding: EdgeInsets.all(8),
        child: TextFormField(
          keyboardType: TextInputType.phone,
          controller: phone_number,
          maxLength: 10,
          textAlign: TextAlign.end,

          decoration: InputDecoration(
              border: OutlineInputBorder(),
              label: Container (
                width: double.infinity,
                child: Text("رقم الهاتف" ,textAlign: TextAlign.end,),
              ),
              hintText: "07******"
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {

              return 'الرجاء ادخال رقم الهاتف ';

            }

            else {
              if (phone_number.text.length < 10) {
                return 'يجب ان يتكون رقم الهاتف من 10 خانات ';
              }
            }
          },
        ),
      ),
    );
  }

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
                              Tosta_mes(mess: "كلمة السر غير متطابقة" ,color: Colors.red);
                            }
                          }
                        },
                        color:   Color(0xff29B6F6),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0)),
                        child: const Text(
                          "إنشاء حساب",
                          style: TextStyle(fontSize: 25, color: Colors.white ),
                        ),
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
      appBar: AppBar(),
      body: Form(
        key: _forKey,
        child: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  colors: [

                    Color(0xff29B6F6),
                    Color(0xff29B6F6),
                    Color(0xff29B6F6),
                  ]
              )
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const <Widget>[
                    SizedBox(height: 10,),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(60), topRight: Radius.circular(60))
                  ),
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.all(30),
                      child: Column(
                        children: <Widget>[
                          SizedBox(height: 60,),

                          Name(),
                          Email(),
                          Phone(),
                          passowrd(),
                          re_passowrd(),
                          SizedBox(height: 40,),

                          button_sign_up(),

                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}



