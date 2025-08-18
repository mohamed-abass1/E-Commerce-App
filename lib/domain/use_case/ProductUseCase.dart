import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../core/failers/failers.dart';
import '../intities/ProductResponseEntity.dart';
import '../repositories/repositories/ProductRepository.dart';
@injectable
class ProductUseCase{
   ProductRepository productRepository;
   ProductUseCase({required this.productRepository});

  Future<Either<Failers, ProductResponseEntity>> invoke()async{
    return await productRepository.getProducts();}
}