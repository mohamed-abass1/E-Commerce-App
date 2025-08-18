import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../core/failers/failers.dart';
import '../../domain/intities/RemoveFavouriteResponseEntity.dart';
import '../../domain/repositories/data_source/RemoveFavouriteDataSource.dart';
import '../../domain/repositories/repositories/FavouriteRepository.dart';
import '../../domain/repositories/repositories/RemoveFavouriteRepository.dart';
@Injectable(as:RemoveFavouriteRepository )
class RemoveFavouriteRepositoryImpl implements RemoveFavouriteRepository{
  RemoveFavouriteDataSource favouriteDataSource;
  RemoveFavouriteRepositoryImpl({required this.favouriteDataSource});

  @override
  Future<Either<Failers, RemoveFavouriteResponseEntity>> RemoveFavourite(String productId) async {
    var either=await favouriteDataSource.RemoveFavourite(productId);
    return either.fold((error) => (left(error)), (response) => (right(response)));  }

  }
