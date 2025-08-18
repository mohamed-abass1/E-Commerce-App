import 'package:dartz/dartz.dart';
import 'package:e_commerece_online_c13/core/failers/failers.dart';
import 'package:e_commerece_online_c13/domain/intities/FavouriteResponseEntity.dart';
import 'package:e_commerece_online_c13/domain/repositories/data_source/FavouriteDataSource.dart';
import 'package:injectable/injectable.dart';
import '../../domain/intities/AddFavouriteResponse.dart';
import '../../domain/repositories/data_source/AddFavouriteDataSource.dart';
import '../../domain/repositories/repositories/AddFavouriteRepository.dart';
import '../../domain/repositories/repositories/FavouriteRepository.dart';
@Injectable(as:AddFavouriteRepository )
class AddFavouriteRepositoryImpl implements AddFavouriteRepository{
  AddFavouriteDataSource addfavouriteDataSource;
  AddFavouriteRepositoryImpl({required this.addfavouriteDataSource});

  @override
  Future<Either<Failers, AddFavouriteResponseEntity>> AddFavourite(String ProductId) async {
    var either=await addfavouriteDataSource.AddFavourite( ProductId);
    return either.fold((error) => (left(error)), (response) => (right(response)));  }

  }
