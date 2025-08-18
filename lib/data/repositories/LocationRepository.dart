import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../core/failers/failers.dart';
import '../../domain/intities/AddLocationResponseEntity.dart';
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
