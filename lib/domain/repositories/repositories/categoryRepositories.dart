import 'package:dartz/dartz.dart';

import '../../../core/failers/failers.dart';
import '../../intities/categoryResponse.dart';

abstract class CategoryRepositories{
  Future<Either<Failers,CategoryResponseEntity>> getCategory();

}