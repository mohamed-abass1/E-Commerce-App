import 'package:dartz/dartz.dart';

import '../../../core/failers/failers.dart';
import '../../intities/GetSpecificProduct.dart';


abstract class GetSpecificProductRepository {
  Future<
      Either<Failers, GetSpecificProductResponseEntity>> GetSpecificProduct(String id);
}