import 'package:dartz/dartz.dart';

import '../../../core/failers/failers.dart';
import '../../intities/ProductResponseEntity.dart';
import '../../intities/categoryResponse.dart';

abstract class ProductDataSource{
  Future<Either<Failers,ProductResponseEntity>> getProducts();

}