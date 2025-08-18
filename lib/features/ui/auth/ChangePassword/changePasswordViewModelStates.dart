import 'package:e_commerece_online_c13/domain/intities/logInResponseEntity.dart';

import '../../../../domain/intities/ChangePasswordResponseEntity.dart';

abstract class changePasswordStates{}
class  changePasswordInitialState extends changePasswordStates{}
class  changePasswordErrorState extends changePasswordStates{
  String errorMsg;
  changePasswordErrorState({required this.errorMsg});
}
class  changePasswordSuccessState extends changePasswordStates{
  ChangePasswordResponseEntity responseEntity;

  changePasswordSuccessState({required this.responseEntity});
}
class  changePasswordLoadingState extends changePasswordStates{}