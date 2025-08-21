
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../../../domain/intities/FavouriteResponseEntity.dart';
import '../../../../../../domain/use_case/ProductUseCase.dart';
import '../../../../../../domain/use_case/addToCartUseCase.dart';
import '../../../cart_screen/cartTabViewModel.dart';
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

  void addToCart(String productId, CartViewModel cartViewModel) async {
    emit(AddToCartLoadingState());

    var either = await addCartUseCase.invoke(productId);

    either.fold((error) {
      emit(AddToCartErrorState(errorMsg: error.ErrorMsg));
    }, (response) {
      cartViewModel.changeCountNumber(response.numOfCartItems);
      emit(AddToCartSuccessState(responseEntity: response));
    });
  }
}