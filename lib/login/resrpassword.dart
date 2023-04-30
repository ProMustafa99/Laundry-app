import 'package:flutter/material.dart';
import 'package:flutter_application_1/data_mangment/backend_app/cubit_firebase.dart';
import 'package:flutter_application_1/data_mangment/backend_app/status_backend.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class restpassword extends StatefulWidget {
  const restpassword({Key? key}) : super(key: key);

  @override
  State<restpassword> createState() => _restpasswordState();
}

class _restpasswordState extends State<restpassword> {


  Widget button_reste () {

    return Container(
      width: double.infinity,
      height: 50,

      child: BlocProvider(
        create: (BuildContext context) => get_data_cubit(LoginInitialdata()),

          child: BlocConsumer<get_data_cubit , status_get_data>(
            listener: (context, state) {},
            builder: (context , state) {
              return RaisedButton (

                onPressed: () {
                  get_data_cubit.get(context).reset_password_using_email(context ,email.text.trim());
                },

                child: Text("إعادة تعيين كلمة المرور",style: TextStyle(color: Colors.white),),

                color: Color(0xFF3C79F5),
              );
            },

          )


    ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: _forKey,
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  colors: [

                    Color(0xFF3C79F5),
                    Color(0xFF3C79F5),
                    Color(0xFF3C79F5),
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
                  children: <Widget>[
                    SizedBox(height: 10,),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(60), topRight: Radius.circular(60))
                  ),
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.all(30),
                      child: Column(
                        children: <Widget>[
                          SizedBox(height: 60,),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [BoxShadow(
                                    color: Color.fromRGBO(225, 95, 27, .3),
                                    blurRadius: 20,
                                    offset: Offset(0, 10)
                                )]
                            ),
                            child: Column(
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      border: Border(bottom: BorderSide(color: Colors.grey))
                                  ),
                                  child: Email(),
                                ),


                              ],
                            ),
                          ),
                          SizedBox(height: 40,),
                          button_reste(),
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


var email = TextEditingController();
var _forKey = GlobalKey<FormState>();


Widget Email() {
  return Container(
    child: TextField(
      controller: email,
      decoration: InputDecoration(
          label: Container (
            width: double.infinity,
            child: Text("البريد الإلكتروني" ,textAlign: TextAlign.end,),
          ),
          hintStyle: TextStyle(color: Colors.grey),
          border: InputBorder.none
      ),
    ),
  );
}
