import 'package:e_commerece_online_c13/domain/intities/RemoveAdressResponseEntity.dart';

class RemoveAddressResponseDm extends RemoveAddressResponseEntity {
  RemoveAddressResponseDm({
      super.status,
      super.message,
      super.data,});

  RemoveAddressResponseDm.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(RemoveAddressDataDm.fromJson(v));
      });
    }
  }
}

class RemoveAddressDataDm extends RemoveAddressDataEntity{
  RemoveAddressDataDm({
      super.id,
      super.name,
      super.details,
      super.phone,
      super.city,});

  RemoveAddressDataDm.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    details = json['details'];
    phone = json['phone'];
    city = json['city'];
  }

}