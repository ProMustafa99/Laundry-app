import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Change_Passowrd extends StatefulWidget {
  const Change_Passowrd({Key? key}) : super(key: key);

  @override
  State<Change_Passowrd> createState() => _Change_PassowrdState();
}

class _Change_PassowrdState extends State<Change_Passowrd> {
  var new_password = TextEditingController();

  var confirm_password = TextEditingController();

  var old_password = TextEditingController();
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
            hintText: ' New Password ',
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
              return 'Enter New  Password';
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
            hintText: 'Confirm Password ',
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
              return 'Enter Confirm  Password';
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
            hintText: 'Old Password  ',
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
                                  // ignore: sort_child_properties_last
                                  child: const Text(
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
                    ),
                  ),
                ))));
  }
}
