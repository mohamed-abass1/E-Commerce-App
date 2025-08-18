import 'package:dartz/dartz.dart';

import '../../../core/failers/failers.dart';
import '../../intities/CartResponseEntity.dart';
import '../../intities/FavouriteResponseEntity.dart';
import '../../intities/RemoveFavouriteResponseEntity.dart';

abstract class RemoveFavouriteDataSource {
  Future<Either<Failers, RemoveFavouriteResponseEntity>> RemoveFavourite(String productId);

}
