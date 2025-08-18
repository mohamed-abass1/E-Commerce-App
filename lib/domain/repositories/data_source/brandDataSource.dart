import 'package:dartz/dartz.dart';

import '../../../core/failers/failers.dart';
import '../../intities/categoryResponse.dart';

abstract class BrandDataSource{
  Future<Either<Failers,CategoryResponseEntity>> getBrands();

}