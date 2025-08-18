import 'package:dartz/dartz.dart';
import 'package:e_commerece_online_c13/core/failers/failers.dart';
import 'package:e_commerece_online_c13/domain/intities/logInResponseEntity.dart';
import 'package:e_commerece_online_c13/domain/repositories/data_source/logInDataSource.dart';
import 'package:injectable/injectable.dart';
import '../../domain/intities/AddToCartResponseEntity.dart';
import '../../domain/repositories/data_source/addToCartDataSource.dart';
import '../../domain/repositories/repositories/addToCartRepositories.dart';
import '../../domain/repositories/repositories/logInRepositories.dart';
@Injectable(as: AddToCartRepositories)
class AddToCartRepositoriesImpl implements AddToCartRepositories {
  AddToCartDataSource addToCartDataSource;
  AddToCartRepositoriesImpl({required this.addToCartDataSource});
  @override
  Future<Either<Failers, AddToCartResponseEntity>> addToCart(String productId) async {
  var either=await addToCartDataSource.AddToCart(productId);
  return either.fold((error) => (left(error)), (response) => (right(response)));
  }
}
