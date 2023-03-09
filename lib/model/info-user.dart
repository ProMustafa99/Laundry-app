class InfoUserModel
{
  late String Email;
  late String Name;
  late String Phone;
  late String Password;
  // late String uId;



  InfoUserModel(
      this.Name,
      this.Email,
      this.Phone,
      // this.uId ,
      this.Password,
      );
  InfoUserModel.fromJson(Map<String,dynamic> json)
  {

    Email =json['Email'];
    Name =json['Name'];
    Phone =json['Phone'];
    Password =json['Password'];
    // uId =json['uid'];
    
  }
  Map<String,dynamic> toMap() {return
    {
      'Name':Name ,
      'Email':Email ,
      'Phone':Phone,
      'Password':Password,
      // 'uid':uId,
    };}

}