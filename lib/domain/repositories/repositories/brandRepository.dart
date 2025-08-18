import 'package:dartz/dartz.dart';

import '../../../core/failers/failers.dart';
import '../../intities/categoryResponse.dart';

abstract class BrandRepository{
  Future<Either<Failers,CategoryResponseEntity>> getBrands();

}