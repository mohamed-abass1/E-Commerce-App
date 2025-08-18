import 'package:dartz/dartz.dart';
import 'package:e_commerece_online_c13/core/failers/failers.dart';
import 'package:e_commerece_online_c13/data/model/ProductResponseDM.dart';
import 'package:e_commerece_online_c13/domain/intities/ProductResponseEntity.dart';
import 'package:e_commerece_online_c13/domain/intities/categoryResponse.dart';
import 'package:e_commerece_online_c13/domain/repositories/data_source/ProductDataSource.dart';
import 'package:e_commerece_online_c13/domain/repositories/repositories/ProductRepository.dart';
import 'package:e_commerece_online_c13/domain/repositories/repositories/brandRepository.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repositories/data_source/brandDataSource.dart';
@Injectable(as:ProductRepository )
class ProductRepositoryImpl implements ProductRepository{
  ProductDataSource productDataSource;
  ProductRepositoryImpl({required this.productDataSource});

  Future<Either<Failers, ProductResponseEntity>> getProducts() async{
    var either=await productDataSource.getProducts();
      return either.fold((error) => (left(error)), (response) => (right(response)));}
  }
