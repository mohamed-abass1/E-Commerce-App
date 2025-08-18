
import '../../domain/intities/SendResetPasswordResponseEntity.dart';

class SendResetPasswordResponseDm extends SendResetPasswordResponseEntity {
  SendResetPasswordResponseDm({
      super.statusMsg,
      super.message,});

  SendResetPasswordResponseDm.fromJson(dynamic json) {
    statusMsg = json['statusMsg'];
    message = json['message'];
  }

}