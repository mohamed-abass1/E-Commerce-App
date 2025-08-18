import 'package:dartz/dartz.dart';
import 'package:e_commerece_online_c13/domain/repositories/repositories/FavouriteRepository.dart';
import 'package:injectable/injectable.dart';
import '../../core/failers/failers.dart';
import '../intities/AddFavouriteResponse.dart';
import '../intities/FavouriteResponseEntity.dart';
import '../repositories/repositories/AddFavouriteRepository.dart';
@injectable
class AddFavouriteUseCase{
AddFavouriteRepository AddfavouriteRepositories;
  AddFavouriteUseCase({required this.AddfavouriteRepositories});

  Future<Either<Failers,AddFavouriteResponseEntity>> invoke(String ProductId)async{
    return await AddfavouriteRepositories.AddFavourite( ProductId);}}
