// ignore_for_file: avoid_single_cascade_in_expression_statements

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/account%20setting/change_email.dart';
import 'package:flutter_application_1/data_mangment/backend_app/cubit_firebase.dart';
import 'package:flutter_application_1/data_mangment/backend_app/status_backend.dart';
import 'package:flutter_application_1/widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Change_Passowrd extends StatefulWidget {
  const Change_Passowrd({Key? key}) : super(key: key);

  @override
  State<Change_Passowrd> createState() => _Change_PassowrdState();
}

class _Change_PassowrdState extends State<Change_Passowrd> {
  var new_password = TextEditingController();

  var confirm_password = TextEditingController();

  var old_password = TextEditingController();

  var check_old_password;
  //Confirm
  bool Show_password = true;
  bool Conf_Show_password = true;
  bool old_Show_password = true;
  var _forKey = GlobalKey<FormState>();

  Widget New_password() {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Container(
        width: double.infinity,
        height: 60,
        child: TextFormField(
          controller: new_password,
          obscureText: Show_password,
          decoration: InputDecoration(
            hintText: 'كلمة مرور جديد',
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

             RegExp capital_char = RegExp(r'^(?=.*?[A-Z])');

          RegExp smal_char = RegExp(r'^(?=.*?[a-z])');

          RegExp spical_char = RegExp(r'^(?=.*?[!@#\$&*~])');

          RegExp number = RegExp(r'^(?=.*?[0-9])');
          
          var passNonNullValue = value ?? "";

            if (value == null || value.isEmpty) {
              return 'هذا الحقل مطلوب';
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

  Widget Confirm_password() {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Container(
        width: double.infinity,
        height: 60,
        child: TextFormField(
          controller: confirm_password,
          obscureText: Conf_Show_password,
          decoration: InputDecoration(
            hintText: 'إعادة كلمة المرور',
            suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    Conf_Show_password = !Conf_Show_password;
                  });
                },
                icon: Icon(Conf_Show_password
                    ? Icons.visibility_off
                    : Icons.visibility)),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'الرجاء إعادة كلمة المرور ';
            }
          },
        ),
      ),
    );
  }

  Widget Old_password() {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Container(
        width: double.infinity,
        height: 60,
        child: TextFormField(
          controller: old_password,
          obscureText: old_Show_password,
          decoration: InputDecoration(
            hintText: 'كلمة المرور القديمة  ',
            suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    old_Show_password = !old_Show_password;
                  });
                },
                icon: Icon(old_Show_password
                    ? Icons.visibility_off
                    : Icons.visibility)),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'الرجاء إدخال كلمة المرور القديمة';
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
                        if (new_password.text == confirm_password.text) {
                          
                          if (check_old_password == old_password.text) {
                            get_data_cubit
                                .get(context)
                                .change_password(context, new_password.text);
                          } 
                          else {
                             AwesomeDialog(
                            context: context,
                            dialogType: DialogType.error,
                            animType: AnimType.rightSlide,
                            desc: 'كلمة المرور القديمة غير صحيحة ',
                            btnCancelOnPress: () {},
                            btnOkOnPress: () {},
                          )..show();

                          }
                        } else {
                          AwesomeDialog(
                            context: context,
                            dialogType: DialogType.error,
                            animType: AnimType.rightSlide,
                            desc: 'كلمة المرور غير متطابقة ',
                            btnCancelOnPress: () {},
                            btnOkOnPress: () {},
                          )..show();
                        }
                      }
                    },
                    color: Colors.blue,
                    child: Text(
                      "تغير كلمة المرور",
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
            check_old_password = get_data_cubit.get(context).Info_user.Password;
            print(" **************** Old Passowrd  ****************");
            print(check_old_password);
            print(" **************** Old Passowrd  ****************");

            return Scaffold(
                appBar: AppBar(
                  title: Text("Change Password"),
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    New_password(),
                                    Confirm_password(),
                                    Old_password(),
                                    const SizedBox(
                                      height: 25,
                                    ),
                                    Save_data(),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ))));
          }),
    );
  }
}
