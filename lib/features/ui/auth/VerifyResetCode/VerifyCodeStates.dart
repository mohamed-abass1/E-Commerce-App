import 'package:e_commerece_online_c13/domain/intities/SendResetPasswordResponseEntity.dart';
import 'package:e_commerece_online_c13/domain/intities/logInResponseEntity.dart';

import '../../../../domain/intities/VerifyCodeResponseEntity.dart';

abstract class VerifyCodeState{}
class  VerifyCodeInitialState extends VerifyCodeState{}
class  VerifyCodeErrorState extends VerifyCodeState{
  String errorMsg;
  VerifyCodeErrorState({required this.errorMsg});
}
class  VerifyCodeSuccessState extends VerifyCodeState{
  VerifyCodeResponseEntity responseEntity;

  VerifyCodeSuccessState({required this.responseEntity});
}
class  VerifyCodeLoadingState extends VerifyCodeState{}