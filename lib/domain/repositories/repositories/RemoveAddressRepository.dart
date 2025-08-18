import 'package:dartz/dartz.dart';

import '../../../core/failers/failers.dart';
import '../../intities/FavouriteResponseEntity.dart';
import '../../intities/RemoveAdressResponseEntity.dart';
import '../../intities/RemoveFavouriteResponseEntity.dart';
import '../../intities/categoryResponse.dart';

abstract class RemoveAddressRepository{
  Future<Either<Failers,RemoveAddressResponseEntity>> RemoveAddress(String ProductId);

}