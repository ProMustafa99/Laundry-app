import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/data_mangment/backend_app/cubit_firebase.dart';
import 'package:flutter_application_1/layout.dart';
import 'package:flutter_application_1/widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data_mangment/backend_app/status_backend.dart';

class login_page extends StatefulWidget {
  const login_page({Key? key}) : super(key: key);

  @override
  State<login_page> createState() => _loginpageState();
}

class _loginpageState extends State<login_page> {

   Widget button_login()
  {
     return BlocProvider (
        create: (BuildContext context) => get_data_cubit(LoginInitialdata()),
        child: BlocConsumer<get_data_cubit , status_get_data>(
          listener: (context, state){},
          builder: (context , state) {
            return ConditionalBuilder (
                condition: state is !Loading_data,
                builder: (context) {
                   return Padding (

                      padding: EdgeInsets.all(8.0),
                       child: Container(
                       width: 600,
                       height: 50,
                       child: RaisedButton
                         (
                         onPressed:  (){
                           if(_forKey.currentState!.validate())
                           {
                             get_data_cubit.get(context).login(context , email.text.trim(),password.text.trim());
                           }
                         },
                         child:Text("Login" ,style:TextStyle(fontSize: 25, color: Colors.white) ,) ,
                         shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(20.0)),
                         color :Color(0xFF3C79F5),
                         

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

  Widget passowrd() {
  return Container(
    child: Padding(
      padding: EdgeInsets.all(12),
      child: TextFormField(
        controller: password,
         obscureText: Show_password,
        // ignore: prefer_const_constructors
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: "Password",
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
            return 'الرجاء إدخال كلمة المرور ';
          }
        },
      ),
    ),
  );
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body: Form(
        key: _forKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              image_app(),
              Email(),
              passowrd(),
              button_login()
            ],
          ),
        ),
      ),
    );
  }
}



var email = TextEditingController();
var password = TextEditingController();
var phone = TextEditingController();
var _forKey = GlobalKey<FormState>();
bool Show_password = true;


Widget image_app() {
  return Container(
    child: Image.asset("assets/login/login-page.jpg"),
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
          if (value == null || value.isEmpty) {
            return 'الرجاء إدخال البريد الالكتروني ';
          }
        },
      ),
    ),
  );
}

