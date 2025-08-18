import 'package:dartz/dartz.dart';
import 'package:e_commerece_online_c13/core/failers/failers.dart';
import 'package:e_commerece_online_c13/domain/intities/FavouriteResponseEntity.dart';
import 'package:e_commerece_online_c13/domain/repositories/data_source/FavouriteDataSource.dart';
import 'package:injectable/injectable.dart';
import '../../domain/repositories/repositories/FavouriteRepository.dart';
@Injectable(as:FavouriteRepository )
class FavouriteRepositoryImpl implements FavouriteRepository{
  FavouriteDataSource favouriteDataSource;
  FavouriteRepositoryImpl({required this.favouriteDataSource});

  @override
  Future<Either<Failers, FavouriteResponseEntity>> getFavourite() async {
    var either=await favouriteDataSource.getFavourite();
    return either.fold((error) => (left(error)), (response) => (right(response)));  }

  }
