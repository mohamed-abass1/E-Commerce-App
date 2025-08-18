import 'package:dartz/dartz.dart';
import 'package:e_commerece_online_c13/domain/intities/ProductResponseEntity.dart';

import '../../../core/failers/failers.dart';
import '../../intities/FavouriteResponseEntity.dart';
import '../../intities/RemoveFavouriteResponseEntity.dart';
import '../../intities/categoryResponse.dart';

abstract class RemoveFavouriteRepository{
  Future<Either<Failers,RemoveFavouriteResponseEntity>> RemoveFavourite(String ProductId);

}