import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../core/failers/failers.dart';
import '../../domain/intities/CartResponseEntity.dart';
import '../../domain/repositories/data_source/CartDataSource.dart';
import '../../domain/repositories/repositories/CartRepositories.dart';


@Injectable(as: CartRepository)
class CartRepositoryImpl implements CartRepository {
  CartRemoteDataSource cartRemoteDataSource;

  CartRepositoryImpl({required this.cartRemoteDataSource});

  @override
  Future<Either<Failers, GetCartResponseEntity>> getItemsInCart() async {
    var either = await cartRemoteDataSource.getItemsInCart();
    return either.fold((error) => Left(error), (response) => Right(response));
  }

  @override
  Future<Either<Failers, GetCartResponseEntity>> deleteItemsInCart(
      String productId) async {
    var either = await cartRemoteDataSource.deleteItemsInCart(productId);
    return either.fold((error) => Left(error), (response) => Right(response));
  }

  @override
  Future<Either<Failers, GetCartResponseEntity>> updateCountInCart(
      String productId, int count) async {
    var either = await cartRemoteDataSource.updateCountInCart(productId, count);
    return either.fold((error) => Left(error), (response) => Right(response));
  }
}