import 'package:dartz/dartz.dart';
import 'package:e_commerece_online_c13/domain/intities/ProductResponseEntity.dart';

import '../../../core/failers/failers.dart';
import '../../intities/FavouriteResponseEntity.dart';
import '../../intities/categoryResponse.dart';

abstract class FavouriteRepository{
  Future<Either<Failers,FavouriteResponseEntity>> getFavourite();

}