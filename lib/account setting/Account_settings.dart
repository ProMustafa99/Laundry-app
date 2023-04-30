import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/account%20setting/account_info.dart';
import 'package:flutter_application_1/account%20setting/change_email.dart';
import 'package:flutter_application_1/account%20setting/change_password.dart';
import 'package:flutter_application_1/data_mangment/shared_preferances/shared-prferances.dart';
import 'package:flutter_application_1/login/login-info.dart';
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
          }

          if (number == 3) {
            navigateto_page(context, Change_Passowrd());
          }
        },
        child: Container(
          child: Row(
             mainAxisAlignment: MainAxisAlignment.end,
            children: [

              Icon(
                Icons.arrow_back_ios_new_sharp ,
                size: 18,
              ),

              Spacer(),

              Text(
                "${name}",
                style: TextStyle(fontSize: 14),
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

                Settings(1, "معلومات الحساب"),
                Settings(2, "تغير البريد الإلكتروني"),
                Settings(3, "تغير كلمة المرور"),
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
                                        navigateto_and_push(context , login_info());
                                      },
                                    ).show();

                                     Logout.RemoveData();

                                  });



                            },
                            child: Text("تسجل الخروج" ,textAlign:TextAlign.right ,)

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
