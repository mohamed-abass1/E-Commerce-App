import 'package:dartz/dartz.dart';

import '../../../core/failers/failers.dart';
import '../../intities/FavouriteResponseEntity.dart';
import '../../intities/RemoveFavouriteResponseEntity.dart';
import '../../intities/categoryResponse.dart';

abstract class RemoveFavouriteRepository{
  Future<Either<Failers,RemoveFavouriteResponseEntity>> RemoveFavourite(String ProductId);

}