

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/account%20setting/Account_settings.dart';
import 'package:flutter_application_1/data_mangment/backend_app/status_backend.dart';
import 'package:flutter_application_1/data_mangment/shared_preferances/shared-prferances.dart';
import 'package:flutter_application_1/layout.dart';
import 'package:flutter_application_1/model/info-user.dart';
import 'package:flutter_application_1/model/info_order.dart';
import 'package:flutter_application_1/widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:crossplat_objectid/crossplat_objectid.dart';

class get_data_cubit extends Cubit<status_get_data> {
  get_data_cubit(super.initialState);

  static get_data_cubit get(context) => BlocProvider.of(context);

  void login(context, String email, String pass) {
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

  void Create_new_account(context, String name, String email, String password, String phone) {
    emit(Loading_data());
    FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password)
        .then((value)
    {
      String id_user = value.user!.uid;
      Information_user(context, name.trim(), email.trim(), password.trim(), id_user, phone);
      emit(Sussess_get_data());
    }).catchError((e)
    {
      emit(Error_state_get_data());
      print(" ********** HERE ERROR **********");
      Tosta_mes(mess: '${e}', color: Colors.red);
      print(" ********** HERE ERROR **********");
    });
  }

  
  //For Firebase Store

  void Information_user(context, String name, String email, String password, String id, String phone) {
    FirebaseFirestore.instance.collection("user").doc(id).set({
      "Name": name.trim(),
      "Email": email.trim(),
      "Password": password.trim(),
      "Phone": phone.trim(),
      "id": id,
    }).then((value) {
      Tosta_mes(mess: 'تم إنشاء حساب جديد ', color: Colors.green);

      print(name.trim());
      print(email.trim());
      print(password.trim());
      print(id);
    }).catchError((e) {
      emit(Error_state_create_account());
    });
  }

  InfoUserModel Info_user = InfoUserModel("", "", "", "");

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

      print("*********** Cubit Data ***********");

      print(Info_user.Name);
      print(Info_user.Email);

      print("*********** Cubit Data ***********");
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

  void change_email(context, String Email,) async
  {
    Data = Cash_Data();
    var cheeck_id = await Data.getData(key: "user_id");
    emit(Loading_change_data());
    FirebaseFirestore.instance.collection("user").doc('${cheeck_id}').update({
      "Email": Email.trim(),
    }).then((value) {
      emit(Sussess_change_data());
      navigateto_and_push(context, AccountSettings());
      Tosta_mes(mess: "تم حفظ البيانات ", color: Colors.green);
    }).catchError((e) {
      emit(Error_state_change_data());
    });
  }

  void change_password(context, String password,) async
  
  {
    Data = Cash_Data();
    var cheeck_id = await Data.getData(key: "user_id");

    emit(Loading_change_data());

    FirebaseFirestore.instance.collection("user").doc('${cheeck_id}').update({
      "Password": password.trim(),
    }).then((value) {
      emit(Sussess_change_data());
      navigateto_and_push(context, AccountSettings());
      Tosta_mes(mess: "تم تغير كلمة المرور ", color: Colors.green);
    }).catchError((e) {
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
        .set(order_details)
        .then((value)
         {

            emit(Sussess_send_order());


        }).catchError((e) {
      emit(Error_state_send_order());

    });
  }
  // End  Send Order


  // send Order For Admin

    void order_for_admin (var id_order , Map<String, dynamic> order_details) {

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
    
  
}

