import 'package:dartz/dartz.dart';
import 'package:e_commerece_online_c13/core/failers/failers.dart';
import 'package:e_commerece_online_c13/domain/intities/logInResponseEntity.dart';

import '../../intities/AddLocationResponseEntity.dart';
import '../../intities/ChangePasswordResponseEntity.dart';


abstract class AddLocationRepositories{
  Future<Either<Failers,AddLocationResponseEntity>> AddLocation(String name,String details,String phone,String city);


}