
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/account%20setting/Account_settings.dart';
import 'package:flutter_application_1/account%20setting/help_page.dart';
import 'package:flutter_application_1/data_mangment/backend_app/cubit_firebase.dart';
import 'package:flutter_application_1/order/list_order.dart';
import 'package:flutter_application_1/point/point.dart';
import 'package:flutter_application_1/widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data_mangment/backend_app/status_backend.dart';

class Account extends StatefulWidget {
  const Account({Key? key}) : super(key: key);

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {

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
            navigateto_page(context, order_list());
          }

          if (number == 2) {
            navigateto_page(context, PointsPage());
          }

          if (number == 4) {
            navigateto_page(context, help_page());
          }

          if (number == 5) {
            AwesomeDialog(
              context: context,
              dialogType: DialogType.info,
              animType: AnimType.rightSlide,
              desc: 'تحت التطوير',
              btnOkOnPress: ()
              {


              },
            ).show();
          }
        },

        child: Padding(
          padding: const EdgeInsets.only(right: 20),
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "${name}",
                  style: TextStyle(fontSize: 15 ,),  textAlign: TextAlign.right,
                ),
                const SizedBox(
                  width: 25,
                ),
                Icon(
                  icon,
                  size: 30,
                  color: Colors.black,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String Name  = "";

  Widget UserName () {
    return BlocProvider(
      create: (BuildContext context) => get_data_cubit(Loading_get_data_user())..get_data_user(),
      child:  BlocConsumer<get_data_cubit, status_get_data>(
        listener: (context, state) {},
          builder: (context, state) {
            Name = get_data_cubit.get(context).Info_user.Name;
            return ConditionalBuilder(
              condition: state is !Loading_get_data_user,

              builder: (context)  {
                return
                  Container(
                    // set your color
                    child: Column(
                      children: [
                        Row(

                          children: [

                            CircleAvatar(
                              backgroundColor: Colors.blue,
                              radius: 20,
                              child: Text(
                                "${Name[0]}",
                                style: TextStyle(fontSize: 24, color: Colors.white),
                              ),
                            ),

                            SizedBox(width: 15,),

                            Expanded(
                              child: Text(
                                "$Name",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),

                            Spacer(),

                            IconButton(
                                onPressed: () {
                                  navigateto_page(context, AccountSettings());
                                  //AccountSettings
                                },
                                icon: Icon(
                                  Icons.settings,
                                  color: Colors.white,
                                ))
                          ],

                        ),
                      ],
                    ),
                  );
              },
              fallback: (context) => Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 120.10, //set your height
        flexibleSpace: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: UserName()
          ),
        ),
      ),
      
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: ClipRRect(
          borderRadius:  BorderRadius.circular(15),
          child: Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.white,
            child: Column(
              children: [
                 const SizedBox(
                  height: 50,
                ),
                
                Items_account_page(1, "طلباتي"),
                const SizedBox(
                  height: 50,
                ),
                Items_account_page(2, "نقاطي"),
                // ignore: prefer_const_constructors
                SizedBox(
                  height: 50,
                ),

                Items_account_page(5, "العروض "),
                const SizedBox(
                  height: 50,
                ),
                Items_account_page(4, "احصل على مساعدة"),
                const SizedBox(
                  height: 50,
                ),



              ],
            ),
          ),
        ),
      ),
    );
  }
}





