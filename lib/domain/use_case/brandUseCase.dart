import 'package:dartz/dartz.dart';
import 'package:e_commerece_online_c13/domain/intities/categoryResponse.dart';
import 'package:e_commerece_online_c13/domain/repositories/repositories/brandRepository.dart';
import 'package:e_commerece_online_c13/domain/repositories/repositories/categoryRepositories.dart';
import 'package:injectable/injectable.dart';

import '../../core/failers/failers.dart';
@injectable
class BrandyUseCase{
   BrandRepository brandRepository;
   BrandyUseCase({required this.brandRepository});

  Future<Either<Failers,CategoryResponseEntity>> invoke()async{
    return await brandRepository.getBrands();}
}