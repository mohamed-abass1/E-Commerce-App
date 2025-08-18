import 'package:dartz/dartz.dart';

import '../../../core/failers/failers.dart';
import '../../intities/AddLocationResponseEntity.dart';
import '../../intities/ChangePasswordResponseEntity.dart';


abstract class AddLocationRepositories{
  Future<Either<Failers,AddLocationResponseEntity>> AddLocation(String name,String details,String phone,String city);


}