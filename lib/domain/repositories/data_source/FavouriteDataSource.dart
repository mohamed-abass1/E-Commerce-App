import 'package:dartz/dartz.dart';
import '../../../core/failers/failers.dart';
import '../../intities/FavouriteResponseEntity.dart';

abstract class FavouriteDataSource {
  Future<Either<Failers, FavouriteResponseEntity>> getFavourite();

}
