import 'package:dartz/dartz.dart';
import 'package:e_commerece_online_c13/core/failers/failers.dart';
import 'package:e_commerece_online_c13/domain/intities/logInResponseEntity.dart';

import '../../intities/ChangePasswordResponseEntity.dart';

abstract class ChangePasswordDataSource{
  Future<Either<Failers,ChangePasswordResponseEntity>>ChangePassword(String oldPassword,String newPassword,String rePassword);
}
