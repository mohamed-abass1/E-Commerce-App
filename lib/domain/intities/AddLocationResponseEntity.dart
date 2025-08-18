class AddLocationResponseEntity {
  AddLocationResponseEntity({
      this.results, 
      this.status, 
      this.data,});

  num? results;
  String? status;
  List<AddLocationDataEntity>? data;


}

class AddLocationDataEntity {
  AddLocationDataEntity({
      this.id, 
      this.name, 
      this.details, 
      this.phone, 
      this.city,});

  String? id;
  String? name;
  String? details;
  String? phone;
  String? city;


}