import 'package:e_commerece_online_c13/core/failers/failers.dart';
import 'package:e_commerece_online_c13/domain/intities/categoryResponse.dart';

import '../../../../../../domain/intities/AddToCartResponseEntity.dart';
import '../../../../../../domain/intities/ProductResponseEntity.dart';

abstract class ProductTabStates{}
class  ProductTabInitialState extends ProductTabStates{}



class ProductErrorState extends ProductTabStates{
  String errorMsg;
  ProductErrorState({required this.errorMsg});
}
class ProductSuccessState extends ProductTabStates{
  ProductResponseEntity responseEntity;

  ProductSuccessState({required this.responseEntity});
}
class  ProductLoadingState extends ProductTabStates{}




class  AddToCartInitialState extends ProductTabStates{}

class AddToCartErrorState extends ProductTabStates{
  String errorMsg;
  AddToCartErrorState({required this.errorMsg});
}
class  AddToCartSuccessState extends ProductTabStates{
  AddToCartResponseEntity responseEntity;

  AddToCartSuccessState({required this.responseEntity});
}
class  AddToCartLoadingState extends ProductTabStates{}

