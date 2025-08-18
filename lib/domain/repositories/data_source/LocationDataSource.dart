import 'package:dartz/dartz.dart';
import 'package:e_commerece_online_c13/domain/intities/AddLocationResponseEntity.dart';

import '../../../core/failers/failers.dart';
import '../../intities/categoryResponse.dart';

abstract class LocationDataSource{
  Future<Either<Failers,AddLocationResponseEntity>> getLocation();

}