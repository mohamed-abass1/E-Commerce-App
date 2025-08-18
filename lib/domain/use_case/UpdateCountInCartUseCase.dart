
import 'package:dartz/dartz.dart';
import 'package:e_commerece_online_c13/core/failers/failers.dart';
import 'package:injectable/injectable.dart';

import '../intities/CartResponseEntity.dart';
import '../repositories/repositories/CartRepositories.dart';

@injectable
class UpdateCountInCartUseCase {
  CartRepository cartRepository;

  UpdateCountInCartUseCase({required this.cartRepository});

    Future<Either<Failers, GetCartResponseEntity>> invoke(
      String productId, int count) {
    return cartRepository.updateCountInCart(productId, count);
  }
}