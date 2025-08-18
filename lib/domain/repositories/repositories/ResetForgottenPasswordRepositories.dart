import 'package:dartz/dartz.dart';
import 'package:e_commerece_online_c13/core/failers/failers.dart';
import 'package:e_commerece_online_c13/domain/intities/logInResponseEntity.dart';

import '../../intities/ResetForgottenPasswordResponseEntity.dart';


abstract class ResetForgottenPasswordRepositories{
  Future<Either<Failers,ResetForgottenPasswordResponseEntity>> ResetForgottenPassword(String email,String password);


}