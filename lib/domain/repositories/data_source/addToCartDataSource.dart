import 'package:dartz/dartz.dart';
import 'package:e_commerece_online_c13/core/failers/failers.dart';
import 'package:e_commerece_online_c13/domain/intities/AddToCartResponseEntity.dart';
import 'package:e_commerece_online_c13/domain/intities/logInResponseEntity.dart';

abstract class AddToCartDataSource{
  Future<Either<Failers,AddToCartResponseEntity>>AddToCart(String productId);
}