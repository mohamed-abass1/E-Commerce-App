import 'package:e_commerece_online_c13/core/cach/SharedPrefrence.dart';
import 'package:e_commerece_online_c13/domain/use_case/ProductUseCase.dart';
import 'package:e_commerece_online_c13/features/ui/pages/cart_screen/cartTabViewModel.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../domain/intities/FavouriteResponseEntity.dart';
import '../../../../../../domain/intities/ProductResponseEntity.dart';
import '../../../../../../domain/use_case/addToCartUseCase.dart';
import 'ProductTabStates.dart';

@injectable
class ProductViewModel extends Cubit<ProductTabStates> {
  ProductUseCase getAllProductsUseCase;
  AddToCartUseCase addCartUseCase;
  ProductViewModel(
      {required this.getAllProductsUseCase, required this.addCartUseCase})
      :super(ProductTabInitialState());

  List<FavouriteDataEntity> productsList = [];
  static ProductViewModel get(context) => BlocProvider.of(context);

  void getAllProducts() async {
    emit(ProductLoadingState());
    var either = await getAllProductsUseCase.invoke();
    either.fold((error) {
      emit(ProductErrorState( errorMsg: error.ErrorMsg));
    }, (response) {
      productsList = response.data!;
      emit(ProductSuccessState(responseEntity: response));
    });
  }

  void addToCart(String productId,context) async {
    CartViewModel.get(context).numOfCart;
    emit(AddToCartLoadingState());
    var either = await addCartUseCase.invoke(productId);
    either.fold((error) {
      emit(AddToCartErrorState(errorMsg: error.ErrorMsg));
    }, (response) {
      CartViewModel.get(context).changeCountNumber(response.numOfCartItems);
      print(CartViewModel.get(context).numOfCart);
      emit(AddToCartSuccessState(responseEntity: response));
    });
  }
}