import 'package:dartz/dartz.dart';
import 'package:e_commerece_online_c13/domain/repositories/repositories/FavouriteRepository.dart';
import 'package:injectable/injectable.dart';
import '../../core/failers/failers.dart';
import '../intities/FavouriteResponseEntity.dart';
import '../intities/RemoveFavouriteResponseEntity.dart';
import '../repositories/repositories/RemoveFavouriteRepository.dart';
@injectable
class RemoveFavouriteUseCase{
RemoveFavouriteRepository favouriteRepositories;
  RemoveFavouriteUseCase({required this.favouriteRepositories});

  Future<Either<Failers,RemoveFavouriteResponseEntity>> invoke(String productId)async{
    return await favouriteRepositories.RemoveFavourite(productId);}}
