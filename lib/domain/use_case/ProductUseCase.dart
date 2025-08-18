import 'package:dartz/dartz.dart';
import 'package:e_commerece_online_c13/domain/intities/ProductResponseEntity.dart';
import 'package:e_commerece_online_c13/domain/intities/categoryResponse.dart';
import 'package:e_commerece_online_c13/domain/repositories/repositories/ProductRepository.dart';
import 'package:e_commerece_online_c13/domain/repositories/repositories/brandRepository.dart';
import 'package:e_commerece_online_c13/domain/repositories/repositories/categoryRepositories.dart';
import 'package:injectable/injectable.dart';

import '../../core/failers/failers.dart';
@injectable
class ProductUseCase{
   ProductRepository productRepository;
   ProductUseCase({required this.productRepository});

  Future<Either<Failers, ProductResponseEntity>> invoke()async{
    return await productRepository.getProducts();}
}