// import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/account%20setting/account_info.dart';
import 'package:flutter_application_1/account%20setting/change_email.dart';
import 'package:flutter_application_1/account%20setting/change_password.dart';
import 'package:flutter_application_1/widget.dart';

class AccountSettings extends StatefulWidget {
  const AccountSettings({Key? key}) : super(key: key);

  @override
  State<AccountSettings> createState() => _AccountSettingsState();
}

class _AccountSettingsState extends State<AccountSettings> {
  Widget Settings(int number, String name) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: InkWell(
        onTap: () {
          if (number == 1) {
            navigateto_page(context, account_info());
          }

          if (number == 2) {
            navigateto_page(context, Change_email());
            //Change_Passowrd

          }

          if (number == 3) {
            navigateto_page(context, Change_Passowrd());
          }
        },
        child: Container(
          child: Row(
            children: [
              Text(
                "${name}",
                style: TextStyle(fontSize: 14),
              ),
              Spacer(),

              // ignore: prefer_const_constructors
              Icon(
                Icons.arrow_forward_ios_outlined,
                size: 18,
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Settings(1, "Account Settings"),
                Settings(2, "Change Mail"),
                Settings(3, "Change Password "),
                const Divider(),
                Padding(
                  padding: EdgeInsets.all(12),
                  child: const Text("Languge"),
                ),
                const Divider(),
                // ignore: prefer_const_constructors
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: const Text("Logout"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
