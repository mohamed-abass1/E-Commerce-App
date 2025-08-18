import 'package:dartz/dartz.dart';
import 'package:e_commerece_online_c13/core/failers/failers.dart';
import 'package:e_commerece_online_c13/domain/intities/CartResponseEntity.dart';
import 'package:injectable/injectable.dart';

import '../repositories/repositories/CartRepositories.dart';

@injectable
class DeleteItemsInCartUseCase {
  CartRepository cartRepository;

  DeleteItemsInCartUseCase({required this.cartRepository});

  Future<Either<Failers, GetCartResponseEntity>> invoke(String productId) {
    return cartRepository.deleteItemsInCart(productId);
  }
}