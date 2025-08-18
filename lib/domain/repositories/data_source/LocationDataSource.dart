import 'package:dartz/dartz.dart';

import '../../../core/failers/failers.dart';
import '../../intities/AddLocationResponseEntity.dart';
import '../../intities/categoryResponse.dart';

abstract class LocationDataSource{
  Future<Either<Failers,AddLocationResponseEntity>> getLocation();

}