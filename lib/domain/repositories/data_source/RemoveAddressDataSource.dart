import 'package:dartz/dartz.dart';

import '../../../core/failers/failers.dart';
import '../../intities/RemoveAdressResponseEntity.dart';

abstract class RemoveAddressDataSource {
  Future<Either<Failers, RemoveAddressResponseEntity>> RemoveAddress(String productId);

}
