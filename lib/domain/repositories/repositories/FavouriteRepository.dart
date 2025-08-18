import 'package:dartz/dartz.dart';

import '../../../core/failers/failers.dart';
import '../../intities/FavouriteResponseEntity.dart';
import '../../intities/categoryResponse.dart';

abstract class FavouriteRepository{
  Future<Either<Failers,FavouriteResponseEntity>> getFavourite();

}