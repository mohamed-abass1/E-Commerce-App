import 'package:dartz/dartz.dart';
import 'package:e_commerece_online_c13/core/api/api_manger.dart';
import 'package:e_commerece_online_c13/core/failers/failers.dart';
import 'package:e_commerece_online_c13/domain/intities/categoryResponse.dart';

import '../../intities/CartResponseEntity.dart';
import '../../intities/GetSpecificProduct.dart';

abstract class GetSpecificProductDataSource {
  Future<Either<Failers, GetSpecificProductResponseEntity>> GetSpecificProduct(String id);

}
