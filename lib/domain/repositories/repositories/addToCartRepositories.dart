import 'package:dartz/dartz.dart';
import 'package:e_commerece_online_c13/core/failers/failers.dart';

import '../../intities/AddToCartResponseEntity.dart';


abstract class AddToCartRepositories{
  Future<Either<Failers,AddToCartResponseEntity>> addToCart(String productId);


}