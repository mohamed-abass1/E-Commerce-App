import 'package:dartz/dartz.dart';
import 'package:e_commerece_online_c13/domain/repositories/repositories/FavouriteRepository.dart';
import 'package:injectable/injectable.dart';
import '../../core/failers/failers.dart';
import '../intities/FavouriteResponseEntity.dart';
@injectable
class FavouriteUseCase{
FavouriteRepository favouriteRepositories;
  FavouriteUseCase({required this.favouriteRepositories});

  Future<Either<Failers,FavouriteResponseEntity>> invoke()async{
    return await favouriteRepositories.getFavourite();}}
