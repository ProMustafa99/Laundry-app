import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/login/login-page.dart';
import 'package:flutter_application_1/login/sign-up.dart';
import 'package:flutter_application_1/widget.dart';

class login_info extends StatefulWidget {
  const login_info({Key? key}) : super(key: key);

  @override
  State<login_info> createState() => _loginState();
}

class _loginState extends State<login_info> {
  Widget login_user() {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RaisedButton(
            onPressed: () {
              navigateto_page(context, login_page());
            },
            child: Text(
              "Login",
              style: TextStyle(color: Colors.white),
            ),
            color: Color(0xFF3C79F5),
          ),
          SizedBox(
            width: 10,
          ),
          RaisedButton(
            onPressed: () {
              navigateto_page(context, Sing_Up());
            },
            child: Text(
              "Sign Up",
              style: TextStyle(color: Colors.white),
            ),
            color: Color(0xFF3C79F5),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: Column(
          children: [

            Name_app(),

            SizedBox(
              height: 20,
            ),

            image_app(),

            login_user(),


          ],
        ),
      ),
    );
  }
}

Widget Name_app() {
  return Container(
    child: Text(
      "Lundary App",
      style: TextStyle(color: Color(0xFF3C79F5), fontSize: 30),
    ),
  );
}

Widget image_app() {
  return Container(
    child: Image.asset("assets/login/login.jpg"),
  );
}

Widget login_paltform() {
  return Container(
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 100,
              height: 2,
              color: Color(0xFF3C79F5),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              "OR",
              style: TextStyle(
                color: Color(0xFF3C79F5),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Container(
              width: 100,
              height: 2,
              color: Color(0xFF3C79F5),
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {},
              child: Container(
                width: 40,
                height: 40,
                child: Image.asset("assets/login/facebook.png"),
              ),
            ),
            SizedBox(
              width: 40,
            ),
            InkWell(
              onTap: () {},
              child: Container(
                width: 40,
                height: 40,
                child: Image.asset("assets/login/telephone.png"),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}



