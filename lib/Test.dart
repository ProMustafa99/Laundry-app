import 'package:flutter/material.dart';

class SignUpBodyScreen extends StatefulWidget {
  const SignUpBodyScreen({super.key});

  @override
  State<SignUpBodyScreen> createState() => _SignUpBodyScreenState();
}

class _SignUpBodyScreenState extends State<SignUpBodyScreen> {
  // FlowController flowController = Get.put(FlowController());
  late int _currentFlow;
  @override
  // void initState() {
  //   _currentFlow = FlowController().currentFlow;
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
            SizedBox(height: 80,),
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
                                child: Name(),
                              ),
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    border: Border(bottom: BorderSide(color: Colors.grey))
                                ),
                                child: passowrd(),
                              ),

                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    border: Border(bottom: BorderSide(color: Colors.grey))
                                ),
                                child: passowrd(),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 40,),
                        Text("Forgot Password?", style: TextStyle(color: Colors.grey),),
                        SizedBox(height: 40,),
                        Container(
                          height: 50,
                          margin: EdgeInsets.symmetric(horizontal: 50),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color:Color(0xFF3C79F5),
                          ),
                          child: Center(
                            child: Text("تسجيل الدخول", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                          ),
                        ),
                        SizedBox(height: 50,),
                        Text("Continue with social media", style: TextStyle(color: Colors.grey),),
                        SizedBox(height: 30,),
                        Row(
                          children: <Widget>[
                            Expanded(
                              child:    Container(
                                height: 50,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: Colors.blue
                                ),
                                child: Center(
                                  child: Text("Facebook", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                                ),
                              ),
                            ),
                            SizedBox(width: 30,),

                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
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
    child: TextField(
      controller: name,
      decoration: InputDecoration(
          hintText: "الإسم",
          hintStyle: TextStyle(color: Colors.grey),
          border: InputBorder.none
      ),
    ),
  );
}

Widget Email() {
  return Container(
    child: TextField(
      controller: email,
      decoration: InputDecoration(
          hintText: "البريد الإلكتروني",
          hintStyle: TextStyle(color: Colors.grey),
          border: InputBorder.none
      ),
    ),
  );
}

Widget passowrd() {
  return Container(
    child: TextField(
      controller: password,
      decoration: InputDecoration(
          hintText: "كلمة المرور",
          hintStyle: TextStyle(color: Colors.grey),
          border: InputBorder.none
      ),
    ),
  );
}

Widget re_passowrd() {
  return Container(
    child: TextField(
      controller: re_password,
      decoration: InputDecoration(
          hintText: "كلمة المرور",
          hintStyle: TextStyle(color: Colors.grey),
          border: InputBorder.none
      ),
    ),
  );
}

Widget Phone() {
  return Container(
    child: TextField(
      controller: phone_number,
      decoration: InputDecoration(
          hintText: "كلمة المرور",
          hintStyle: TextStyle(color: Colors.grey),
          border: InputBorder.none
      ),
    ),
  );
}
