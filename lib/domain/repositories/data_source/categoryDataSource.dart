import 'package:dartz/dartz.dart';

import '../../../core/failers/failers.dart';
import '../../intities/categoryResponse.dart';

abstract class CategoryDataSource{
  Future<Either<Failers,CategoryResponseEntity>> getCategory();
}