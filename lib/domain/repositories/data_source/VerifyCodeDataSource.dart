import 'package:dartz/dartz.dart';

import '../../../core/failers/failers.dart';
import '../../intities/VerifyCodeResponseEntity.dart';

abstract class VerifyCodeDataSource{
  Future<Either<Failers,VerifyCodeResponseEntity>>VerifyCode(String Code);
}