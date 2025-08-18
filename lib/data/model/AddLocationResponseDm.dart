
import '../../domain/intities/AddLocationResponseEntity.dart';

class AddLocationResponseDm extends AddLocationResponseEntity {
  AddLocationResponseDm({
      super.results,
      super.status,
      super.data,});

  AddLocationResponseDm.fromJson(dynamic json) {
    results = json['results'];
    status = json['status'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(AddLocationDataDm.fromJson(v));
      });
    }
  }


}

class AddLocationDataDm extends AddLocationDataEntity {
  AddLocationDataDm({
      super.id,
      super.name,
      super.details,
      super.phone,
      super.city,});

  AddLocationDataDm.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    details = json['details'];
    phone = json['phone'];
    city = json['city'];
  }


}