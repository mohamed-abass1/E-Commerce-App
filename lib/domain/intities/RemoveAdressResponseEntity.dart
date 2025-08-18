class RemoveAddressResponseEntity {
  RemoveAddressResponseEntity({
      this.status, 
      this.message, 
      this.data,});

  String? status;
  String? message;
  List<RemoveAddressDataEntity>? data;


}

class RemoveAddressDataEntity {
  RemoveAddressDataEntity({
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