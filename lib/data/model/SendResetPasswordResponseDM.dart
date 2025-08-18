import 'package:e_commerece_online_c13/domain/intities/SendResetPasswordResponseEntity.dart';

class SendResetPasswordResponseDm extends SendResetPasswordResponseEntity {
  SendResetPasswordResponseDm({
      super.statusMsg,
      super.message,});

  SendResetPasswordResponseDm.fromJson(dynamic json) {
    statusMsg = json['statusMsg'];
    message = json['message'];
  }

}