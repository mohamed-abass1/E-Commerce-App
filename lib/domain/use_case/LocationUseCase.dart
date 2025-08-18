import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../core/failers/failers.dart';
import '../intities/AddLocationResponseEntity.dart';
import '../repositories/repositories/LocationRepository.dart';
@injectable
class LocationUseCase{
   LocationRepository brandRepository;
   LocationUseCase({required this.brandRepository});

  Future<Either<Failers, AddLocationResponseEntity>> invoke()async{
    return await brandRepository.getLocation();}
}