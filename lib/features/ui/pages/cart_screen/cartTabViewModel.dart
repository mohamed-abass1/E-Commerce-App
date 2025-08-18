import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/intities/CartResponseEntity.dart';
import '../../../../domain/use_case/CartUseCase.dart';
import '../../../../domain/use_case/DeleteFromCartUseCase.dart';
import '../../../../domain/use_case/UpdateCountInCartUseCase.dart';
import 'cartTabStates.dart';

@injectable
class CartViewModel extends Cubit<CartStates> {
  GetItemsInCartUseCase getItemsInCartUseCase;
  DeleteItemsInCartUseCase deleteItemsInCartUseCase;

  UpdateCountInCartUseCase updateCountInCartUseCase;

  CartViewModel(
      {required this.getItemsInCartUseCase,
        required this.deleteItemsInCartUseCase,
        required this.updateCountInCartUseCase})
      : super(GetCartLoadingState());

  //todo: hold data - handle logic
  List<GetProductEntity> productsItemsList = [];

  static CartViewModel get(context) => BlocProvider.of<CartViewModel>(context);
  num numOfCart= 0;
  void getItemsInCart() async {
    emit(GetCartLoadingState());
    var either = await getItemsInCartUseCase.invoke();
    either.fold((error) {
      emit(GetCartErrorState(failures: error));
    }, (response) {
      changeCountNumber(response.numOfCartItems);
      productsItemsList = response.data!.products!;
      emit(GetCartSuccessState(responseEntity: response));
    });
  }

  void deleteItemsInCart(String productId) async {
    // emit(DeleteItemsInCartLoadingState());
    var either = await deleteItemsInCartUseCase.invoke(productId);
    either.fold((error) {
      emit(DeleteItemsInCartErrorState(failures: error));
    }, (response) {
      changeCountNumber(response.numOfCartItems);
      productsItemsList = response.data!.products!;
      print('delete successfully');
      emit(GetCartSuccessState(responseEntity: response));
    });
  }

  void updateCountInCart(String productId, int count) async {
    // emit(DeleteItemsInCartLoadingState());
    var either = await updateCountInCartUseCase.invoke(productId, count);
    either.fold((error) {
      emit(UpdateCountInCartErrorState(failures: error));
    }, (response) {
      numOfCart=response.numOfCartItems!;
      // productsItemsList = response.data!.products!;
      print('updated successfully');
      emit(GetCartSuccessState(responseEntity: response));
    });
  }
  void changeCountNumber (newNumber){
    numOfCart=newNumber;
    emit(changeNumOfCart());
  }
}