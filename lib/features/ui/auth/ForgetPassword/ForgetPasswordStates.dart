import 'package:e_commerece_online_c13/domain/intities/SendResetPasswordResponseEntity.dart';
import 'package:e_commerece_online_c13/domain/intities/logInResponseEntity.dart';

abstract class ForgetPasswordState{}
class  ForgetPasswordInitialState extends ForgetPasswordState{}
class  ForgetPasswordErrorState extends ForgetPasswordState{
  String errorMsg;
  ForgetPasswordErrorState({required this.errorMsg});
}
class  SendResetPasswordSuccessState extends ForgetPasswordState{
  SendResetPasswordResponseEntity responseEntity;

  SendResetPasswordSuccessState({required this.responseEntity});
}
class  ForgetPasswordLoadingState extends ForgetPasswordState{}