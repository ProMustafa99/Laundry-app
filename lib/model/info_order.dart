class Info_OrderModel
{
  late String Id_user;
   String Name='';
  // late String phone;
  // late String Del;
  // late String Service;
  // late String sub_Total;
  // late String Total;



  Info_OrderModel(
      this.Id_user,
      this.Name ,
      // this.phone ,
      // this.Del,
      // this.Service,
      // this.sub_Total,
      // this.Total,
      );


  Info_OrderModel.fromJson(Map<String,dynamic> json)
  {
    Id_user =json['Id_user'];
    Name =json['Name'];
    // phone =json['Service'];
    // Del =json['Del'];
    // Service = json['الخدمة'];
    // sub_Total = json['السعر'];
    // Total = json['المجموع'];

  }
  Map<String,dynamic> toMap()
  {return
    {
      // 'Id_user':Id_user ,
       // 'Name':Name ,
      // 'Service':phone,
      // 'Del':Del,
      // 'الخدمة' :Service,
      // 'السعر' : sub_Total,
      // 'المجموع' : Total

    };}

}