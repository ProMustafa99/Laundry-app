class PointsModel
{
  late int number;
  late bool status;

  PointsModel(
      this.number,
      this.status,
      );
  PointsModel.fromJson(Map<String,dynamic> json)
  {

    number =json['number'];
    status =json['status'];
  }
  Map<String,dynamic> toMap() {return
    {
      'number':number ,
      'status':status ,
    };}

}