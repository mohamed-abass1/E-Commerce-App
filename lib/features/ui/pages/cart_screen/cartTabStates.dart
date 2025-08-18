import '../../../../core/failers/failers.dart';
import 'package:e_commerece_online_c13/domain/intities/categoryResponse.dart';

import '../../../../../../domain/intities/AddToCartResponseEntity.dart';
import '../../../../../../domain/intities/ProductResponseEntity.dart';
import '../../../../domain/intities/CartResponseEntity.dart';

abstract class CartStates {}

class GetCartLoadingState extends CartStates {}

class GetCartErrorState extends CartStates {
  Failers failures;

  GetCartErrorState({required this.failures});
}

class GetCartSuccessState extends CartStates {
  GetCartResponseEntity responseEntity;

  GetCartSuccessState({required this.responseEntity});
}

class DeleteItemsInCartLoadingState extends CartStates {}

class DeleteItemsInCartErrorState extends CartStates {
  Failers failures;

  DeleteItemsInCartErrorState({required this.failures});
}

class DeleteItemsInCartSuccessState extends CartStates {
  GetCartResponseEntity responseEntity;

  DeleteItemsInCartSuccessState({required this.responseEntity});
}

class UpdateCountInCartLoadingState extends CartStates {}

class UpdateCountInCartErrorState extends CartStates {
  Failers failures;

  UpdateCountInCartErrorState({required this.failures});
}

class UpdateCountInCartSuccessState extends CartStates {
  GetCartResponseEntity responseEntity;

  UpdateCountInCartSuccessState({required this.responseEntity});
}
class changeNumOfCart extends CartStates{}