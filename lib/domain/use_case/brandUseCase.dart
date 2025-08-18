import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../core/failers/failers.dart';
import '../intities/categoryResponse.dart';
import '../repositories/repositories/brandRepository.dart';
@injectable
class BrandyUseCase{
   BrandRepository brandRepository;
   BrandyUseCase({required this.brandRepository});

  Future<Either<Failers,CategoryResponseEntity>> invoke()async{
    return await brandRepository.getBrands();}
}