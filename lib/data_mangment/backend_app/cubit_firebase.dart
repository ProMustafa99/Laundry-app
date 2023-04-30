

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/data_mangment/backend_app/status_backend.dart';
import 'package:flutter_application_1/data_mangment/shared_preferances/shared-prferances.dart';
import 'package:flutter_application_1/layout.dart';
import 'package:flutter_application_1/login/login-info.dart';
import 'package:flutter_application_1/model/info-user.dart';
import 'package:flutter_application_1/model/point_model.dart';
import 'package:flutter_application_1/widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:crossplat_objectid/crossplat_objectid.dart';

class get_data_cubit extends Cubit<status_get_data> {
  get_data_cubit(super.initialState);

  static get_data_cubit get(context) => BlocProvider.of(context);

  void login(context, String email, String pass)
  {
    emit(Loading_data());

    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: pass)
        .then((value) {
      Cash_Data().Save_Data(key: "user_id", value: value.user!.uid);
      navigateto_and_push(context, layout());
      emit(Sussess_get_data());
    }).catchError((e) {
      emit(Error_state_get_data());

      if (e.toString() ==
          "[firebase_auth/user-not-found] There is no user record corresponding to this identifier. The user may have been deleted.") {
        Tosta_mes(
            mess: 'لم يتم العثور على هذا البريد الإلكتروني', color: Colors.red);
      } else {
        Tosta_mes(
            mess: 'يوجد خطأ في كلمة المرور أو في البريد الإلكتروني',
            color: Colors.red);
      }
    });
  }

  void Create_new_account(context, String name, String email, String password, String phone)

  {
    emit(Loading_data());
    FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password)
        .then((value)
    {
      String id_user = value.user!.uid;
      Information_user(context, name.trim(), email.trim(),id_user, phone);
      
      
      emit(Sussess_get_data());
    }).catchError((e)
    {
      emit(Error_state_get_data());
      if (e.toString() == "[firebase_auth/email-already-in-use] The email address is already in use by another account.")
      Tosta_mes(mess: 'هذا الايميل موجود بالفعل ', color: Colors.red);
    });
  }

  
  //For Firebase Store

  void Information_user(context, String name, String email, String id, String phone)

  {
    FirebaseFirestore.instance.collection("user").doc(id).set({
      "Name": name.trim(),
      "Email": email.trim(),
      "Phone": phone.trim(),
      "id": id,
    }).then((value) {


      FirebaseFirestore.instance.collection("user").doc(id).collection("Points").doc(id).set({
        "number":0,
        "status":false,
      }).then((value)  {
        Tosta_mes(mess: 'تم إنشاء حساب جديد ', color: Colors.green);

      });



    }).catchError((e) {
      emit(Error_state_create_account());
    });
  }

  InfoUserModel Info_user = InfoUserModel("", "", "");

  void get_data_user() async 
  
  {
    Data = Cash_Data();
    var cheeck_id = await Data.getData(key: "user_id");

    emit(Loading_get_data_user());

    FirebaseFirestore.instance
        .collection("user")
        .doc("${cheeck_id}")
        .get()
        .then((value) {
      emit(Sussess_get_data_user());
      print("Sussess");

      Info_user = InfoUserModel.fromJson(value.data()!);
    }).catchError((e) {
      emit(Error_state_get_data_user());

      print("*********** Error ***********");

      print("Error " + e.toString());
    });
  }

  void change_name_phone(context, String New_Name, String New_phone) async
  
  {
    Data = Cash_Data();
    var cheeck_id = await Data.getData(key: "user_id");

    emit(Loading_change_data());

    FirebaseFirestore.instance.collection("user").doc('${cheeck_id}').update({
      "Name": New_Name.trim(),
      "Phone": New_phone.trim(),
    }).then((value) {
      emit(Sussess_change_data());
      navigateto_and_push(context, layout());
      Tosta_mes(mess: "تم حفظ البيانات ", color: Colors.green);
    }).catchError((e) {
      emit(Error_state_change_data());
    });
  }

  void change_email(context, String Email,String current_password) async

  {

    emit(Loading_change_data());

    final user = await FirebaseAuth.instance.currentUser;


    final cred = EmailAuthProvider.credential(email: user!.email!, password:current_password);

    FirebaseAuth.instance.fetchSignInMethodsForEmail(Email)
        .then((value) {

         if (value.isNotEmpty) {
            Tosta_mes(mess: 'هذا الايميل موجود بالفعل ', color: Colors.red);
            emit(Error_state_change_data());
          }

         else {
           // Update email
           user.reauthenticateWithCredential(cred).then((_) {
             user.updateEmail(Email).then((value) {
               change_email_fire_store(context,Email );

               emit(Sussess_change_data());
             }).catchError((error) {
               emit(Error_state_change_data());
             });
           }).catchError((error) {
             emit(Error_state_change_data());
           });
         }

        })

        .catchError((error) {
          emit(Error_state_change_data());
    });
  }

  void change_email_fire_store (context ,String Email) async {

    Data = Cash_Data();
    var cheeck_id = await Data.getData(key: "user_id");
    FirebaseFirestore.instance.collection("user").doc('${cheeck_id}').update({
      "Email": Email.trim(),
    }).then((value) {
      emit(Sussess_change_data());
      navigateto_and_push(context, login_info());
      Data.RemoveData();
      Tosta_mes(mess: "تم حفظ البيانات ", color: Colors.green);
    }).catchError((e) {
      emit(Error_state_change_data());
    });
  }


  void change_password(context, String new_password,String current_password) async {

    emit(Loading_change_data());
    final user = await FirebaseAuth.instance.currentUser;

    final cred = EmailAuthProvider.credential(

        email: user!.email!, password:current_password);

    user.reauthenticateWithCredential(cred).then((value) {
      user.updatePassword(new_password).then((value) {
        emit(Sussess_change_data());
      }).catchError((error)
      {


      });
    }).catchError((err) {

      emit(Error_state_change_data());
      AwesomeDialog(
        context: context,
        dialogType: DialogType.error,
        animType: AnimType.rightSlide,
        desc: 'كلمة المرور القديمة غير صحيحة ',
        btnCancelOnPress: () {},
        btnOkOnPress: () {},
      )..show();

      print (err.toString());
    });


  }




  void reset_password_using_email(context ,String Email) {

    emit(Loading_change_data());

    FirebaseAuth.instance.sendPasswordResetEmail(email:Email)
        .then((value) {

              print("Done send email");
              AwesomeDialog(
                context: context,
                dialogType: DialogType.info,
                animType: AnimType.rightSlide,
                desc: 'تم إرسال رسالة الى بريدك الإلكتروني',

                btnOkOnPress: () {
                  navigateto_and_push(context ,login_info());
                },
              )..show();

              emit(Sussess_change_data());
          })
        .catchError((error) {

            print(error.toString());

            if(error.toString() =="[firebase_auth/user-not-found] There is no user record corresponding to this identifier. The user may have been deleted.") {
              AwesomeDialog(
                context: context,
                dialogType: DialogType.info,
                animType: AnimType.rightSlide,
                desc: 'البريد الإلكتروني غير موجود يرجى تأكد من صحة البريد المدخل',
                btnOkOnPress: () {},
              )..show();

            }


            emit(Error_state_change_data());

          });
  }

  
  // Send Order

  void order_user( Map<String, dynamic> order_details) async
  
  {
      Data = Cash_Data();
      var cheeck_id = await Data.getData(key: "user_id");
      ObjectId id_order = new ObjectId();

      emit(Loading_send_order());

    FirebaseFirestore.instance.collection("user").doc('${cheeck_id}').get()
        .then((value)
    {

      Info_user = InfoUserModel.fromJson(value.data()!);
      String Id_user = value.id;
      var Id_order = id_order;


       order_details ["Id_user"] = Id_user;
      order_details ["Name"] = Info_user.Name;
      order_details ["phone"] = Info_user.Phone;
      order_details ["Id_order"] = Id_order.toString();
      Info_order(Id_user, Id_order,order_details);
      order_for_admin(Id_order ,order_details);

    }).
     catchError((e) {

        print(e);
       print( "Here Error when Sending  To  InFo Order ");

     });
  }


  void Info_order(String Id_user, var id_order, Map<String, dynamic> order_details)

  {
         FirebaseFirestore.instance.collection("user").doc("${Id_user}" ,)
        .collection("order")
        .doc("${id_order}")
        .set(order_details ,)
        .then((value)
         {

            emit(Sussess_send_order());


        }).catchError((e) {
      emit(Error_state_send_order());

    });
  }

  // End  Send Order




  // send Order For Admin

    void order_for_admin (var id_order , Map<String, dynamic> order_details)

    {

        emit(Loading_send_order_for_admin());
        FirebaseFirestore.instance.collection("orders")
            .doc("${id_order}")
            .set(order_details)
            .then((value)
            {
              print("Done Send data");
              emit(Sussess_send_order_for_admin());
            })
            .catchError((e){

               print("Here Error ");
               print(e.toString());
               emit(Error_state_send_order_for_admin());
            });
    
    }



  CollectionReference  orders = FirebaseFirestore.instance.collection('user').doc("sd")
      .collection('order');

  void list_order () async {
    Data = Cash_Data();
    var cheeck_id = await Data.getData(key: "user_id");

    emit(Loading_get_list_order());
       orders = FirebaseFirestore.instance.collection('user')
        .doc("${cheeck_id}")
        .collection('order');

  }

//  End send Order For Admin
  
  

// Info Points 

  PointsModel info_points  = PointsModel(0 , true);

  void get_points () async{
  Data = Cash_Data();
  var cheeck_id = await Data.getData(key: "user_id");

  emit(Loading_get_points());

  FirebaseFirestore.instance.collection("user")
      .doc(cheeck_id)
      .collection("Points")
      .doc(cheeck_id)
      .get()
      .then((value) {
          info_points =PointsModel.fromJson(value.data()!);
          print(info_points.number);

          emit(Sussess_get_points());
      })
      .catchError((error_points){

        print("*****************************************");
        print(error_points.toString());
        print("*****************************************");

        emit(Error_get_points());

      });

}

  void change_value_points (int new_point)async{
    Data = Cash_Data();
    var cheeck_id = await Data.getData(key: "user_id");
    emit(Loading_change_points());
    FirebaseFirestore.instance.collection("user")
        .doc(cheeck_id)
        .collection("Points")
        .doc(cheeck_id).update(
              {
                "number":new_point,
                 "status":true,
              }
          )
        .then((value)  {

              info_points.number = new_point;
            emit(Sussess_change_points());

          })
        .catchError((error_update_points){

          emit(Error_change_points());

          });
  }

}

