import 'package:dartz/dartz.dart';
import 'package:e_commerece_online_c13/core/failers/failers.dart';
import 'package:e_commerece_online_c13/domain/intities/UpdateUserDataResponseEntity.dart';

import '../../intities/VerifyCodeResponseEntity.dart';

abstract class VerifyCodeDataSource{
  Future<Either<Failers,VerifyCodeResponseEntity>>VerifyCode(String Code);
}