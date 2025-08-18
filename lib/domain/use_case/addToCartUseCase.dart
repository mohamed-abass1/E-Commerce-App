import 'package:dartz/dartz.dart';
import 'package:e_commerece_online_c13/core/failers/failers.dart';
import 'package:e_commerece_online_c13/domain/intities/AddToCartResponseEntity.dart';
import 'package:e_commerece_online_c13/domain/intities/logInResponseEntity.dart';
import 'package:e_commerece_online_c13/domain/repositories/repositories/logInRepositories.dart';
import 'package:injectable/injectable.dart';

import '../repositories/repositories/addToCartRepositories.dart';
@injectable
class AddToCartUseCase{
  AddToCartRepositories addToCartRepositories;
  AddToCartUseCase({required this.addToCartRepositories});

  Future<Either<Failers, AddToCartResponseEntity>> invoke(String productId)async{
    return await addToCartRepositories.addToCart(productId);}
}     