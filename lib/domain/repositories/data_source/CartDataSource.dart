import 'package:dartz/dartz.dart';
import 'package:e_commerece_online_c13/core/api/api_manger.dart';
import 'package:e_commerece_online_c13/core/failers/failers.dart';
import 'package:e_commerece_online_c13/domain/intities/categoryResponse.dart';

import '../../intities/CartResponseEntity.dart';

abstract class CartRemoteDataSource {
  Future<Either<Failers, GetCartResponseEntity>> getItemsInCart();
  Future<Either<Failers, GetCartResponseEntity>> deleteItemsInCart(
      String productId);

  Future<Either<Failers, GetCartResponseEntity>> updateCountInCart(
      String productId, int count);
}
