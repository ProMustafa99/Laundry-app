import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/details.dart';
import 'package:flutter_application_1/home.dart';
import 'package:flutter_application_1/widget.dart';

class Account extends StatefulWidget {
  const Account({Key? key}) : super(key: key);

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  // ignore: prefer_final_fields
  List<IconData> _icons = [
    Icons.turned_in_not_outlined,
    Icons.account_balance_wallet_outlined,
    Icons.info_outline,
    Icons.support_agent_sharp,
    Icons.local_offer_outlined,
  ];
  //wysiwyg_rounded

  Widget Items_account_page(int number, String name) {
    IconData icon = Icons.abc;

    if (number == 1) {
      icon = _icons[0];
    } else if (number == 2) {
      icon = _icons[1];
    } else if (number == 3) {
      icon = _icons[2];
    } else if (number == 4) {
      icon = _icons[3];
    } else if (number == 5) {
      icon = _icons[4];
    }
    return Padding(
      padding: const EdgeInsets.only(
        left: 20,
      ),
      child: InkWell(
        onTap: () {
          if (number == 1) {
            //navigateto_page(context , Home());
          }

          if (number == 2) {
            //navigateto_page(context , Detailes());
          }
        },
        child: Container(
          child: Row(
            children: [
              Icon(
                icon,
                size: 30,
                color: Colors.black,
              ),
              const SizedBox(
                width: 25,
              ),
              Text(
                "${name}",
                style: TextStyle(fontSize: 15),
              ),
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
        toolbarHeight: 120.10, //set your height
        flexibleSpace: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              color: Colors.white, // set your color
              child: Column(
                children: [
                  Row(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      // ignore: prefer_const_constructors
                      CircleAvatar(
                        backgroundColor: Colors.blue,
                        radius: 20,
                        child: Text(
                          "M",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text("Mustafa Salameh"),
                      Spacer(),

                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.settings,
                            color: Colors.grey,
                          ))
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Items_account_page(1, "Your Order"),
            SizedBox(
              height: 50,
            ),
            Items_account_page(2, "Your Point"),
            SizedBox(
              height: 50,
            ),
            Items_account_page(5, "Offers"),
            SizedBox(
              height: 50,
            ),
            Items_account_page(4, "Get Help"),
            SizedBox(
              height: 50,
            ),
            Items_account_page(3, "About"),
          ],
        ),
      ),
    );
  }
}
