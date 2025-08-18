import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../core/failers/failers.dart';
import '../intities/FavouriteResponseEntity.dart';
import '../repositories/repositories/FavouriteRepository.dart';
@injectable
class FavouriteUseCase{
FavouriteRepository favouriteRepositories;
  FavouriteUseCase({required this.favouriteRepositories});

  Future<Either<Failers,FavouriteResponseEntity>> invoke()async{
    return await favouriteRepositories.getFavourite();}}
