
import '../../domain/intities/ChangePasswordResponseEntity.dart';

class ChangePasswordResponseDm extends ChangePasswordResponseEntity {
  ChangePasswordResponseDm({
      super.message,
      super.user,
      super.token,});

  ChangePasswordResponseDm.fromJson(dynamic json) {
    message = json['message'];
    user = json['user'] != null ? ChangePasswordUserDM.fromJson(json['user']) : null;
    token = json['token'];
  }


}

class ChangePasswordUserDM extends ChangePasswordUserEntity{
  ChangePasswordUserDM({
      super.name,
      super.email,
      super.role,});

  ChangePasswordUserDM.fromJson(dynamic json) {
    name = json['name'];
    email = json['email'];
    role = json['role'];
  }


}