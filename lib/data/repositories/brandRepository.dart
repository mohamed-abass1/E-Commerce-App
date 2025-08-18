import 'package:dartz/dartz.dart';
import 'package:e_commerece_online_c13/core/failers/failers.dart';
import 'package:e_commerece_online_c13/domain/intities/categoryResponse.dart';
import 'package:e_commerece_online_c13/domain/repositories/repositories/brandRepository.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repositories/data_source/brandDataSource.dart';
@Injectable(as:BrandRepository )
class BrandRepositoryImpl implements BrandRepository{
  BrandDataSource brandDataSource;
  BrandRepositoryImpl({required this.brandDataSource});

  Future<Either<Failers, CategoryResponseEntity>> getBrands() async{
    var either=await brandDataSource.getBrands();
      return either.fold((error) => (left(error)), (response) => (right(response)));}
  }
