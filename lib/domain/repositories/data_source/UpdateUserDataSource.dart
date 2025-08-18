import 'package:dartz/dartz.dart';

import '../../../core/failers/failers.dart';
import '../../intities/UpdateUserDataResponseEntity.dart';

abstract class UpdateUserDataSource{
  Future<Either<Failers,UpdateUserDataResponseEntity>>UpdateUser(String name,String email,String phone);
}