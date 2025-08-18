
import '../../../../domain/intities/logInResponseEntity.dart';

abstract class LogInStates{}
class  LogInInitialState extends LogInStates{}
class  LogInErrorState extends LogInStates{
  String errorMsg;
  LogInErrorState({required this.errorMsg});
}
class  LogInSuccessState extends LogInStates{
  LogInResponseEntity responseEntity;

  LogInSuccessState({required this.responseEntity});
}
class  LogInLoadingState extends LogInStates{}