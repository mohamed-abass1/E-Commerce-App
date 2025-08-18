import 'package:dartz/dartz.dart';
import 'package:e_commerece_online_c13/core/failers/failers.dart';
import 'package:e_commerece_online_c13/domain/intities/logInResponseEntity.dart';

import '../../intities/SendResetPasswordResponseEntity.dart';
import '../../intities/VerifyCodeResponseEntity.dart';


abstract class VerifyCodeRepositories{
  Future<Either<Failers,VerifyCodeResponseEntity>> VerifyCode(String code);


}