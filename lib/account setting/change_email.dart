import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

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
            hintText: 'Password ',
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
              return 'Enter Your  Password';
            }
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                NewEmail(),
                                Confirm_Email(),
                                password_function(),

                                // ignore: prefer_const_constructors
                                SizedBox(
                                  height: 25,
                                ),
                                // ignore: prefer_const_constructors

                                Padding(
                                  padding: EdgeInsets.all(12),
                                  child: Container(
                                    width: double.infinity,
                                    child: RaisedButton(
                                      onPressed: () {
                                        if (_forKey.currentState!.validate()) {
                                          print(
                                              "//////////////////////////////////");
                                          print("Done Save Data");
                                          print(
                                              "//////////////////////////////////");
                                        }
                                      },
                                      child: Text(
                                        "Submit",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      color: Colors.blue,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ))))));
  }
}

var new_email = TextEditingController();
var confirm_email = TextEditingController();
var phone = TextEditingController();
var password = TextEditingController();
bool Show_password = true;
var _forKey = GlobalKey<FormState>();

Widget NewEmail() {
  return Container(
    child: Padding(
      padding: EdgeInsets.all(12),
      child: TextFormField(
        controller: new_email,
        // ignore: prefer_const_constructors
        decoration: InputDecoration(
          labelText: "New Email",
          hintText: 'example@example.com',
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please Enter New  Email';
          }
        },
      ),
    ),
  );
}

Widget Confirm_Email() {
  return Container(
    child: Padding(
      padding: EdgeInsets.all(12),
      child: TextFormField(
        controller: confirm_email,
        // ignore: prefer_const_constructors
        decoration: InputDecoration(
          labelText: "Confirm Email",
          hintText: 'example@example.com ',
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please Enter Confirm Email';
          }
        },
      ),
    ),
  );
}



//  Form(
//         key: _forKey,
//         child: SingleChildScrollView(
//           child: Container(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 NewEmail(),
//                 Confirm_Email(),
//                 password_function(),

//                 // ignore: prefer_const_constructors
//                 SizedBox(
//                   height: 25,
//                 ),
//                 // ignore: prefer_const_constructors

//                 Padding(
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