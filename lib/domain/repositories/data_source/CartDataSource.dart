import 'package:dartz/dartz.dart';

import '../../../core/failers/failers.dart';
import '../../intities/CartResponseEntity.dart';

abstract class CartRemoteDataSource {
  Future<Either<Failers, GetCartResponseEntity>> getItemsInCart();
  Future<Either<Failers, GetCartResponseEntity>> deleteItemsInCart(
      String productId);

  Future<Either<Failers, GetCartResponseEntity>> updateCountInCart(
      String productId, int count);
}
