
import '../../domain/intities/UpdateUserDataResponseEntity.dart';

class UpdateUserDataResponseDm extends UpdateUserDataResponseEntity{
  UpdateUserDataResponseDm({
      super.message,
      super.user,});

  UpdateUserDataResponseDm.fromJson(dynamic json) {
    message = json['message'];
    user = json['user'] != null ? UserDM.fromJson(json['user']) : null;
  }

}

class UserDM extends UserEntity {
  UserDM({
      super.name,
      super.email,
      super.role,});

  UserDM.fromJson(dynamic json) {
    name = json['name'];
    email = json['email'];
    role = json['role'];
  }



}