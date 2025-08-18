import 'package:dartz/dartz.dart';
import 'package:e_commerece_online_c13/core/failers/failers.dart';
import 'package:e_commerece_online_c13/domain/intities/AddLocationResponseEntity.dart';
import 'package:e_commerece_online_c13/domain/intities/categoryResponse.dart';
import 'package:e_commerece_online_c13/domain/repositories/repositories/brandRepository.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repositories/data_source/LocationDataSource.dart';
import '../../domain/repositories/data_source/brandDataSource.dart';
import '../../domain/repositories/repositories/LocationRepository.dart';

@Injectable(as:LocationRepository )
class LocationRepositoryImpl implements LocationRepository{
  LocationDataSource brandDataSource;
  LocationRepositoryImpl({required this.brandDataSource});

  Future<Either<Failers, AddLocationResponseEntity>> getLocation() async{
    var either=await brandDataSource.getLocation();
      return either.fold((error) => (left(error)), (response) => (right(response)));}
  }
