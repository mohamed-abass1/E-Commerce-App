
import '../../../../domain/intities/ResetForgottenPasswordResponseEntity.dart';

abstract class ResetForgottenPasswordState{}
class ResetForgottenPasswordInitialState extends ResetForgottenPasswordState{}
class  ResetForgottenPasswordErrorState extends ResetForgottenPasswordState{
  String errorMsg;
  ResetForgottenPasswordErrorState({required this.errorMsg});
}
class  ResetForgottenPasswordSuccessState extends ResetForgottenPasswordState{
  ResetForgottenPasswordResponseEntity responseEntity;

  ResetForgottenPasswordSuccessState({required this.responseEntity});
}
class  ResetForgottenPasswordLoadingState extends ResetForgottenPasswordState{}