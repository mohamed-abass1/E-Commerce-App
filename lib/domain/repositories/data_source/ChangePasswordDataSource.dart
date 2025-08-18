import 'package:dartz/dartz.dart';

import '../../../core/failers/failers.dart';
import '../../intities/ChangePasswordResponseEntity.dart';

abstract class ChangePasswordDataSource{
  Future<Either<Failers,ChangePasswordResponseEntity>>ChangePassword(String oldPassword,String newPassword,String rePassword);
}
