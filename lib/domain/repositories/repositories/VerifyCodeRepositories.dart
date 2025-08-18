import 'package:dartz/dartz.dart';

import '../../../core/failers/failers.dart';
import '../../intities/SendResetPasswordResponseEntity.dart';
import '../../intities/VerifyCodeResponseEntity.dart';


abstract class VerifyCodeRepositories{
  Future<Either<Failers,VerifyCodeResponseEntity>> VerifyCode(String code);


}