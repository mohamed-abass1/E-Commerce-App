import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../core/failers/failers.dart';
import '../intities/AddToCartResponseEntity.dart';
import '../repositories/repositories/addToCartRepositories.dart';
@injectable
class AddToCartUseCase{
  AddToCartRepositories addToCartRepositories;
  AddToCartUseCase({required this.addToCartRepositories});

  Future<Either<Failers, AddToCartResponseEntity>> invoke(String productId)async{
    return await addToCartRepositories.addToCart(productId);}
}     