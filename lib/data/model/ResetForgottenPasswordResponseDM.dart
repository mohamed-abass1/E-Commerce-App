import 'package:e_commerece_online_c13/domain/intities/ResetForgottenPasswordResponseEntity.dart';

class ResetForgottenPasswordResponseDm extends ResetForgottenPasswordResponseEntity {
  ResetForgottenPasswordResponseDm({
      super.token,});

  ResetForgottenPasswordResponseDm.fromJson(dynamic json) {
    token = json['token'];
  }


}