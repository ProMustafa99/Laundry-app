import 'package:dropdown_button2/custom_dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class account_info extends StatefulWidget {
  const account_info({Key? key}) : super(key: key);

  @override
  State<account_info> createState() => _account_infoState();
}

class _account_infoState extends State<account_info> {
  Object _selected = "d";

  bool vi = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Setting Info"),
      ),
      body: Form(
        key: _forKey,
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Fname(),
                LName(),
                Phone(),

                Padding(
                  padding: EdgeInsets.all(12),
                  child: CustomDropdownButton2(
                    hint: 'Select Item',
                    dropdownItems: items,
                    value: selectedValue,
                    onChanged: (value) {
                      setState(() {
                        selectedValue = value;
                      });
                    },
                  ),
                ),
                // ignore: prefer_const_constructors
                SizedBox(
                  height: 25,
                ),
                // ignore: prefer_const_constructors
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  // ignore: prefer_const_constructors
                  child: Text(
                    "Gender (optional)",
                    style: TextStyle(color: Color(0xffBDC3C7)),
                  ),
                ),

                Row(
                  children: [
                    Radio(
                      value: "d",
                      groupValue: _selected,
                      onChanged: (value) {
                        setState(() {
                          _selected = value!;
                        });
                        print(_selected);
                      },
                    ),
                    Text("Mail"),
                    Radio(
                      value: "Fmail",
                      groupValue: _selected,
                      onChanged: (value) {
                        setState(() {
                          _selected = value!;
                        });
                      },
                    ),
                    Text("Fmail"),
                  ],
                ),

                Padding(
                  padding: EdgeInsets.all(12),
                  child: Container(
                    width: double.infinity,
                    child: RaisedButton(
                      onPressed: () {
                        if (_forKey.currentState!.validate()) {
                          print("//////////////////////////////////");
                          print("Done Save Data");
                          print("//////////////////////////////////");
                        }
                      },
                      child: Text(
                        "Save Data",
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
    );
  }
}

var fname = TextEditingController();
var lname = TextEditingController();
var phone = TextEditingController();
var _forKey = GlobalKey<FormState>();

Widget Fname() {
  return Container(
    child: Padding(
      padding: EdgeInsets.all(12),
      child: TextFormField(
        controller: fname,
        // ignore: prefer_const_constructors
        decoration: InputDecoration(
          labelText: "First name",
          hintText: 'Mustafa ',
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please Enter  Email';
          }
        },
      ),
    ),
  );
}

Widget LName() {
  return Container(
    child: Padding(
      padding: EdgeInsets.all(12),
      child: TextFormField(
        controller: lname,
        // ignore: prefer_const_constructors
        decoration: InputDecoration(
          labelText: "Last name",
          hintText: 'Mustafa ',
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please Enter  Email';
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
        maxLength: 10,
        controller: phone,
        // ignore: prefer_const_constructors
        decoration: InputDecoration(
          labelText: "Phone Number",
          hintText: '07********',
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please Enter  Email';
          }
        },
      ),
    ),
  );
}

final List<String> items = [
  'سكن الفحياء',
  'سكن قصر الطالب',
  'سكن طيبة 1',
  'سكن طيبة 2',
  'سكن عمر السلمان ',
  'سكن الزيادنة',
  'سكن البنات الجامعة',
  'سكن البيداء',
];
String? selectedValue;
