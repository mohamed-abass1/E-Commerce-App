import 'package:dartz/dartz.dart';

import '../../../core/failers/failers.dart';
import '../../intities/AddFavouriteResponse.dart';
import '../../intities/FavouriteResponseEntity.dart';

abstract class AddFavouriteRepository{
  Future<Either<Failers,AddFavouriteResponseEntity>> AddFavourite(String ProductId);

}
