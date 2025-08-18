import 'package:dartz/dartz.dart';

import '../../../core/failers/failers.dart';
import '../../intities/AddToCartResponseEntity.dart';


abstract class AddToCartRepositories{
  Future<Either<Failers,AddToCartResponseEntity>> addToCart(String productId);


}