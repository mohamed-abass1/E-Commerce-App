import 'package:e_commerece_online_c13/core/failers/failers.dart';
import 'package:e_commerece_online_c13/domain/intities/categoryResponse.dart';

import '../../../../../../domain/intities/AddFavouriteResponse.dart';
import '../../../../../../domain/intities/AddToCartResponseEntity.dart';
import '../../../../../../domain/intities/FavouriteResponseEntity.dart';
import '../../../../../../domain/intities/ProductResponseEntity.dart';
import '../../../../../../domain/intities/RemoveFavouriteResponseEntity.dart';

abstract class FavouriteTabStates{}
class  FavouriteTabInitialState extends FavouriteTabStates{}



class FavouriteErrorState extends FavouriteTabStates{
  String errorMsg;
  FavouriteErrorState({required this.errorMsg});
}
class FavouriteSuccessState extends FavouriteTabStates{
  FavouriteResponseEntity responseEntity;

  FavouriteSuccessState({required this.responseEntity});
}
class  FavouriteLoadingState extends FavouriteTabStates{}

class AddFavouriteErrorState extends FavouriteTabStates{
  String errorMsg;
  AddFavouriteErrorState({required this.errorMsg});
}
class AddFavouriteSuccessState extends FavouriteTabStates{
  AddFavouriteResponseEntity responseEntity;

  AddFavouriteSuccessState({required this.responseEntity});
}
class  AddFavouriteLoadingState extends FavouriteTabStates{}

class RemoveFavouriteErrorState extends FavouriteTabStates{
  String errorMsg;
 RemoveFavouriteErrorState({required this.errorMsg});
}
class RemoveFavouriteSuccessState extends FavouriteTabStates{
  RemoveFavouriteResponseEntity responseEntity;

  RemoveFavouriteSuccessState({required this.responseEntity});
}
class  RemoveFavouriteLoadingState extends FavouriteTabStates{}
