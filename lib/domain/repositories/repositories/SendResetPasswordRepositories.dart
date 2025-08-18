import 'package:dartz/dartz.dart';

import '../../../core/failers/failers.dart';
import '../../intities/SendResetPasswordResponseEntity.dart';


abstract class SendResetPasswordRepositories{
  Future<Either<Failers,SendResetPasswordResponseEntity>> SendResetPassword(String email);


}