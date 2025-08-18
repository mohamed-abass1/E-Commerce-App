import 'package:e_commerece_online_c13/core/failers/failers.dart';
import 'package:e_commerece_online_c13/domain/intities/RegisterResponse.dart';

abstract class RegisterScreenStates{}
class InitialRegisterScreen extends RegisterScreenStates{}
class LoadingRegisterScreen extends RegisterScreenStates{}
class SuccessRegisterScreen extends RegisterScreenStates{
  RegisterResponseEntity registerResponseEntity;
  SuccessRegisterScreen({required this.registerResponseEntity});

}

class ErrorRegisterScreen extends RegisterScreenStates{
  Failers errorMsg;

  ErrorRegisterScreen({required this.errorMsg}); }
