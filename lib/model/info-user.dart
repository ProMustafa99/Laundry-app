class InfoUserModel
{
  late String Email;
  late String Name;
  late String Phone;
  // late String uId;



  InfoUserModel(
      this.Name,
      this.Email,
      this.Phone,
      // this.uId ,
      );
  InfoUserModel.fromJson(Map<String,dynamic> json)
  {

    Email =json['Email'];
    Name =json['Name'];
    Phone =json['Phone'];
    // uId =json['uid'];
    
  }
  Map<String,dynamic> toMap() {return
    {
      'Name':Name ,
      'Email':Email ,
      'Phone':Phone,
      // 'uid':uId,
    };}

}