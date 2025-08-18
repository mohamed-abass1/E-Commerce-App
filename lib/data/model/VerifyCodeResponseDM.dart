
import '../../domain/intities/VerifyCodeResponseEntity.dart';

class VerifyCodeResponseDm extends VerifyCodeResponseEntity{
  VerifyCodeResponseDm({
      super.status,});

  VerifyCodeResponseDm.fromJson(dynamic json) {
    status = json['status'];
  }


}