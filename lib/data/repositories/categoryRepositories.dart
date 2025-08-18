import 'package:dartz/dartz.dart';
import 'package:e_commerece_online_c13/core/failers/failers.dart';
import 'package:e_commerece_online_c13/domain/intities/categoryResponse.dart';
import 'package:e_commerece_online_c13/domain/repositories/data_source/categoryDataSource.dart';
import 'package:e_commerece_online_c13/domain/repositories/repositories/categoryRepositories.dart';
import 'package:injectable/injectable.dart';
@Injectable(as:CategoryRepositories )
class CategoryRepositoryImpl implements CategoryRepositories{
  CategoryDataSource categoryDataSource;
  CategoryRepositoryImpl({required this.categoryDataSource});
  Future<Either<Failers, CategoryResponseEntity>> getCategory() async {
    var either=await categoryDataSource.getCategory();
    return either.fold((error) => (left(error)), (response) => (right(response)));}
}