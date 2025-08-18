import 'package:dartz/dartz.dart';

import '../../../core/failers/failers.dart';
import '../../intities/AddFavouriteResponse.dart';
import '../../intities/CartResponseEntity.dart';
import '../../intities/FavouriteResponseEntity.dart';

abstract class AddFavouriteDataSource {
  Future<Either<Failers, AddFavouriteResponseEntity>> AddFavourite(String ProductId);

}
