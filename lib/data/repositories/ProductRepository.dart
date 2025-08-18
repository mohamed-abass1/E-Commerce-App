import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../core/failers/failers.dart';
import '../../domain/intities/ProductResponseEntity.dart';
import '../../domain/repositories/data_source/ProductDataSource.dart';
import '../../domain/repositories/data_source/brandDataSource.dart';
import '../../domain/repositories/repositories/ProductRepository.dart';
@Injectable(as:ProductRepository )
class ProductRepositoryImpl implements ProductRepository{
  ProductDataSource productDataSource;
  ProductRepositoryImpl({required this.productDataSource});

  Future<Either<Failers, ProductResponseEntity>> getProducts() async{
    var either=await productDataSource.getProducts();
      return either.fold((error) => (left(error)), (response) => (right(response)));}
  }
