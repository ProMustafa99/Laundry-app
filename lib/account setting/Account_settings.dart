import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/account%20setting/account_info.dart';
import 'package:flutter_application_1/account%20setting/change_email.dart';
import 'package:flutter_application_1/account%20setting/change_password.dart';
import 'package:flutter_application_1/account%20setting/help_page.dart';
import 'package:flutter_application_1/data_mangment/shared_preferances/shared-prferances.dart';
import 'package:flutter_application_1/login/login-page.dart';
import 'package:flutter_application_1/order/list_order.dart';
import 'package:flutter_application_1/widget.dart';

class AccountSettings extends StatefulWidget {
  const AccountSettings({Key? key}) : super(key: key);

  @override
  State<AccountSettings> createState() => _AccountSettingsState();
}

class _AccountSettingsState extends State<AccountSettings> {


  final List<IconData> _icons = [
    Icons.account_circle,
    Icons.email,
    Icons.lock,
    Icons.shopping_bag,
    Icons.help_outline,
    Icons.comment
  ];


  Widget Settings(int number, String name) {


    IconData icon = Icons.abc;

    switch(number) {
      case 1: {
        icon = _icons[0];
      }
      break;
      case 2: {
        icon = _icons[1];
      }
      break;

      case 3: {
        icon = _icons[2];
      }
      break;

      case 4: {
        icon = _icons[3];
      }
      break;


      case 5: {
        icon = _icons[4];
      }
      break;

      case 6: {
        icon = _icons[5];
      }

      break;

      default: {
        icon = _icons[0];
      }
      break;
    }

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: InkWell(
        onTap: () {

          if (number == 1) {
            navigateto_page(context, account_info());
          }

          if (number == 2) {
            navigateto_page(context, Change_email());
          }

          if (number == 3) {
            navigateto_page(context, Change_Passowrd());
          }

          if (number == 4) {
            navigateto_page(context, order_list());
          }

          if (number == 5) {
            navigateto_page(context, help_page());
          }

          if (number == 6) {
            navigateto_page(context, help_page());
          }


        },
        child: Container(
          child: Row(
             mainAxisAlignment: MainAxisAlignment.end,
            children: [

              const Icon(
                Icons.arrow_back_ios_new_sharp ,
                size: 18,
                color: Color(0xff29B6F6),
              ),

              Spacer(),

              Row(
                children: [
                  Text(
                    "${name}",
                    style: TextStyle(fontSize: 14 ),
                  ),
                  SizedBox(width:7,),
                  Icon(
                    icon,
                    size: 20,
                    color: Color(0xff29B6F6),
                  ),
                ],
              ),



              //Spacer(),
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
        title: Text("الإعدادت"),
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

                Settings(4, "طلباتي"),
                const Divider(),

                Settings(1, "معلومات الحساب"),
                Settings(2, "تغير البريد الإلكتروني"),
                Settings(3, "تغير كلمة المرور"),


                const Divider(),

                Settings(5, "احصل على مساعدة"),
                Settings(6, "الإقتراح والشكاوي"),

                const Divider(),

                Row(

                  mainAxisAlignment: MainAxisAlignment.end,

                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child:
                      InkWell
                        (

                            onTap: () {
                              var Logout  = Cash_Data();
                              FirebaseAuth.instance.signOut().then((value)
                                  {
                                    AwesomeDialog(
                                      context: context,
                                      dialogType: DialogType.question,
                                      animType: AnimType.rightSlide,
                                      desc: 'سيتم تسجيل الخروج من هذا الحساب هل أنت متأكد من هذا  ؟',
                                      btnCancelOnPress: () {},
                                      btnOkOnPress: () {
                                        navigateto_and_push(context , login_page());
                                      },
                                    ).show();

                                     Logout.RemoveData();

                                  });

                            },
                            child: Row (
                              children: const [



                                Text("تسجل الخروج" ,textAlign:TextAlign.right ,),

                                SizedBox(width:7,),

                                Icon(
                                  Icons.logout,
                                  size: 20,
                                  color: Color(0xff29B6F6),
                                ),
                              ],
                            )

                       ),
                    )
                  ],
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
