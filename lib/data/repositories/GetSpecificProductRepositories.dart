import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../core/failers/failers.dart';
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