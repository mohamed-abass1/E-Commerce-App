import 'package:dartz/dartz.dart';

import '../../../core/failers/failers.dart';
import '../../intities/SendResetPasswordResponseEntity.dart';

abstract class SendResetPasswordDataSource{
  Future<Either<Failers,SendResetPasswordResponseEntity>>SendResetPassword(String email);
}