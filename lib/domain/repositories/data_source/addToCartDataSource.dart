import 'package:dartz/dartz.dart';

import '../../../core/failers/failers.dart';
import '../../intities/AddToCartResponseEntity.dart';

abstract class AddToCartDataSource{
  Future<Either<Failers,AddToCartResponseEntity>>AddToCart(String productId);
}