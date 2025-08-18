import 'package:dartz/dartz.dart';
import 'package:e_commerece_online_c13/domain/intities/categoryResponse.dart';
import 'package:e_commerece_online_c13/domain/repositories/repositories/brandRepository.dart';
import 'package:e_commerece_online_c13/domain/repositories/repositories/categoryRepositories.dart';
import 'package:injectable/injectable.dart';

import '../../core/failers/failers.dart';
import '../intities/CartResponseEntity.dart';
import '../repositories/repositories/CartRepositories.dart';
@injectable
class GetItemsInCartUseCase {
  CartRepository cartRepository;

  GetItemsInCartUseCase({required this.cartRepository});

  Future<Either<Failers, GetCartResponseEntity>> invoke() {
    return cartRepository.getItemsInCart();
  }
}