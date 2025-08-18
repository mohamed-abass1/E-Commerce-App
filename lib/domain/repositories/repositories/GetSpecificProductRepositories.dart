import 'package:dartz/dartz.dart';
import 'package:e_commerece_online_c13/domain/intities/GetSpecificProduct.dart';

import '../../../core/failers/failers.dart';


abstract class GetSpecificProductRepository {
  Future<
      Either<Failers, GetSpecificProductResponseEntity>> GetSpecificProduct(String id);
}