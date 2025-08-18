import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../core/failers/failers.dart';
import '../../domain/intities/RemoveAdressResponseEntity.dart';
import '../../domain/intities/RemoveFavouriteResponseEntity.dart';
import '../../domain/repositories/data_source/RemoveAddressDataSource.dart';
import '../../domain/repositories/data_source/RemoveFavouriteDataSource.dart';
import '../../domain/repositories/repositories/FavouriteRepository.dart';
import '../../domain/repositories/repositories/RemoveAddressRepository.dart';
import '../../domain/repositories/repositories/RemoveFavouriteRepository.dart';
@Injectable(as:RemoveAddressRepository )
class RemoveAddressRepositoryImpl implements RemoveAddressRepository{
  RemoveAddressDataSource AddressDataSource;
  RemoveAddressRepositoryImpl({required this.AddressDataSource});

  @override
  Future<Either<Failers, RemoveAddressResponseEntity>> RemoveAddress(String productId) async {
    var either=await AddressDataSource.RemoveAddress(productId);
    return either.fold((error) => (left(error)), (response) => (right(response)));  }

  }
