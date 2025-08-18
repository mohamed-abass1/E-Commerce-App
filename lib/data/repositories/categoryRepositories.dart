import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../core/failers/failers.dart';
import '../../domain/intities/categoryResponse.dart';
import '../../domain/repositories/data_source/categoryDataSource.dart';
import '../../domain/repositories/repositories/categoryRepositories.dart';
@Injectable(as:CategoryRepositories )
class CategoryRepositoryImpl implements CategoryRepositories{
  CategoryDataSource categoryDataSource;
  CategoryRepositoryImpl({required this.categoryDataSource});
  Future<Either<Failers, CategoryResponseEntity>> getCategory() async {
    var either=await categoryDataSource.getCategory();
    return either.fold((error) => (left(error)), (response) => (right(response)));}
}