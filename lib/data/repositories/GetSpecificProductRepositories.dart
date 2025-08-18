import 'package:dartz/dartz.dart';
import 'package:e_commerece_online_c13/core/failers/failers.dart';
import 'package:e_commerece_online_c13/domain/intities/categoryResponse.dart';
import 'package:e_commerece_online_c13/domain/repositories/data_source/categoryDataSource.dart';
import 'package:e_commerece_online_c13/domain/repositories/repositories/categoryRepositories.dart';
import 'package:injectable/injectable.dart';

import '../../domain/intities/GetSpecificProduct.dart';
import '../../domain/repositories/data_source/GetSpecificProductDataSource.dart';
import '../../domain/repositories/repositories/GetSpecificProductRepositories.dart';
@Injectable(as:GetSpecificProductRepository )
class GetSpecificProductRepositoryImpl implements GetSpecificProductRepository{
  GetSpecificProductDataSource categoryDataSource;
  GetSpecificProductRepositoryImpl({required this.categoryDataSource});
  Future<Either<Failers, GetSpecificProductResponseEntity>> GetSpecificProduct(String id) async {
    var either=await categoryDataSource.GetSpecificProduct(id);
    return either.fold((error) => (left(error)), (response) => (right(response)));}
}