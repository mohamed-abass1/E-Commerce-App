import 'package:dartz/dartz.dart';
import 'package:e_commerece_online_c13/domain/repositories/repositories/FavouriteRepository.dart';
import 'package:injectable/injectable.dart';
import '../../core/failers/failers.dart';
import '../intities/FavouriteResponseEntity.dart';
import '../intities/RemoveAdressResponseEntity.dart';
import '../intities/RemoveFavouriteResponseEntity.dart';
import '../repositories/repositories/RemoveAddressRepository.dart';
import '../repositories/repositories/RemoveFavouriteRepository.dart';
@injectable
class RemoveAddressUseCase{
RemoveAddressRepository AddressRepositories;
  RemoveAddressUseCase({required this.AddressRepositories});

  Future<Either<Failers,RemoveAddressResponseEntity>> invoke(String productId)async{
    return await AddressRepositories.RemoveAddress(productId);}}
