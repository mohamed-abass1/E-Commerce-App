
import '../../domain/intities/ResetForgottenPasswordResponseEntity.dart';

class ResetForgottenPasswordResponseDm extends ResetForgottenPasswordResponseEntity {
  ResetForgottenPasswordResponseDm({
      super.token,});

  ResetForgottenPasswordResponseDm.fromJson(dynamic json) {
    token = json['token'];
  }


}