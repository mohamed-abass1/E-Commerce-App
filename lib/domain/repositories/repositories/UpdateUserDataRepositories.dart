import 'package:dartz/dartz.dart';
import 'package:e_commerece_online_c13/core/failers/failers.dart';
import 'package:e_commerece_online_c13/domain/intities/logInResponseEntity.dart';

import '../../intities/UpdateUserDataResponseEntity.dart';


abstract class UpdateUserDataRepositories{
  Future<Either<Failers,UpdateUserDataResponseEntity>>UpdateUser(String name,String email,String phone);


}