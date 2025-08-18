import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../core/failers/failers.dart';
import '../../domain/intities/categoryResponse.dart';
import '../../domain/repositories/data_source/brandDataSource.dart';
import '../../domain/repositories/repositories/brandRepository.dart';
@Injectable(as:BrandRepository )
class BrandRepositoryImpl implements BrandRepository{
  BrandDataSource brandDataSource;
  BrandRepositoryImpl({required this.brandDataSource});

  Future<Either<Failers, CategoryResponseEntity>> getBrands() async{
    var either=await brandDataSource.getBrands();
      return either.fold((error) => (left(error)), (response) => (right(response)));}
  }
