import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/data_mangment/backend_app/cubit_firebase.dart';
import 'package:flutter_application_1/login/resrpassword.dart';
import 'package:flutter_application_1/login/sign-up.dart';
import 'package:flutter_application_1/widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data_mangment/backend_app/status_backend.dart';

class login_page extends StatefulWidget {
  const login_page({Key? key}) : super(key: key);

  @override
  State<login_page> createState() => _loginpageState();
}

class _loginpageState extends State<login_page> {

  var email = TextEditingController();
  var password = TextEditingController();
  var phone = TextEditingController();
  var _forKey = GlobalKey<FormState>();
  bool Show_password = true;

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

                       width: double.infinity,
                       height: 50,
                       child: RaisedButton
                         (
                         onPressed:  (){
                           if(_forKey.currentState!.validate())
                           {
                             get_data_cubit.get(context).login(context , email.text.trim(),password.text.trim());
                           }
                         },
                         child:Text("تسجيل الدخول" ,style:TextStyle(color: Colors.white) ,) ,
                         shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(20.0)),
                         color : Color(0xff29B6F6),
                         

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

  Widget passowrd()

   {
     return Container(
       child: TextField(
         controller: password,
         obscureText: Show_password,
         decoration: InputDecoration(
             label: Container (
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
             ),
             hintStyle: TextStyle(color: Colors.grey),
             border: InputBorder.none
         ),
       ),
     );
   }


   Widget image_app()

   {
     return Container(
       child: Image.asset("assets/login/login-page.jpg"),
     );
   }

   Widget Email()

   {
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
                    Color(0xff29B6F6)
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

                          Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Color.fromRGBO(225, 95, 27, .3),
                                    blurRadius: 20,
                                    offset: Offset(0, 10)
                                )]
                            ),

                            child: Column(
                              children: <Widget>[
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: const BoxDecoration(
                                      border: Border(bottom: BorderSide(color: Colors.grey))
                                  ),
                                  child: Email(),
                                ),

                                Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: const BoxDecoration(
                                      border: Border(bottom: BorderSide(color: Colors.grey))
                                  ),
                                  child: passowrd(),
                                ),

                              ],
                            ),
                          ),

                          const SizedBox(height: 30,),

                          TextButton(
                              onPressed: () {
                                navigateto_page(context ,restpassword());
                              },
                              child:  Text("هل نسيت كلمة المرور ؟", style: TextStyle(color: Colors.grey),),

                          ),

                          TextButton(
                            onPressed: () {
                              navigateto_page(context ,Sing_Up());
                            },
                            child:  const Text("إنشاء حساب جديد",
                              style: TextStyle(color: Colors.blue, fontSize: 20),),

                          ),

                          const SizedBox(height: 30,),

                          button_login(),


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


