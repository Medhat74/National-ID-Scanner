class CitizenHub{
  String? id;
  String? firstName;
  String? familyName;
  String? address;
  String? city;
  String? subCity;
  String? crime;

  CitizenHub.fromJson(var jsonData){
    //TODO :: Create Function
  }
  CitizenHub(){
    id = '30109122739';
    firstName = 'احمد';
    familyName = 'مدحت عبدالعزيز عبدالعال';
    address = '1 ش شيخ عبيد رقم 4 ش عزبة ';
    city = 'القاهرة';
    subCity = 'المرج';
    crime = 'لا يوجد حالات جنائية';
  }

}