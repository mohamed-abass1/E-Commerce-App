import 'package:dartz/dartz.dart';

import '../../../core/failers/failers.dart';
import '../../intities/CartResponseEntity.dart';
import '../../intities/categoryResponse.dart';

abstract class CartRepository {
  Future<Either<Failers, GetCartResponseEntity>> getItemsInCart();

  Future<Either<Failers, GetCartResponseEntity>> deleteItemsInCart(
      String productId);

  Future<Either<Failers, GetCartResponseEntity>> updateCountInCart(
      String productId, int count);
}

