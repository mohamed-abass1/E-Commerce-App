import 'package:dartz/dartz.dart';
import 'package:e_commerece_online_c13/domain/intities/AddLocationResponseEntity.dart';
import 'package:e_commerece_online_c13/domain/intities/categoryResponse.dart';
import 'package:e_commerece_online_c13/domain/repositories/repositories/brandRepository.dart';
import 'package:e_commerece_online_c13/domain/repositories/repositories/categoryRepositories.dart';
import 'package:injectable/injectable.dart';

import '../../core/failers/failers.dart';
import '../repositories/repositories/LocationRepository.dart';
@injectable
class LocationUseCase{
   LocationRepository brandRepository;
   LocationUseCase({required this.brandRepository});

  Future<Either<Failers, AddLocationResponseEntity>> invoke()async{
    return await brandRepository.getLocation();}
}