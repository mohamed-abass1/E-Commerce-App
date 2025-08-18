import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../core/failers/failers.dart';
import '../intities/CartResponseEntity.dart';
import '../repositories/repositories/CartRepositories.dart';

@injectable
class DeleteItemsInCartUseCase {
  CartRepository cartRepository;

  DeleteItemsInCartUseCase({required this.cartRepository});

  Future<Either<Failers, GetCartResponseEntity>> invoke(String productId) {
    return cartRepository.deleteItemsInCart(productId);
  }
}