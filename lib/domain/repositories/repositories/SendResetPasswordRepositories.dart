import 'package:dartz/dartz.dart';
import 'package:e_commerece_online_c13/core/failers/failers.dart';
import 'package:e_commerece_online_c13/domain/intities/logInResponseEntity.dart';

import '../../intities/SendResetPasswordResponseEntity.dart';


abstract class SendResetPasswordRepositories{
  Future<Either<Failers,SendResetPasswordResponseEntity>> SendResetPassword(String email);


}