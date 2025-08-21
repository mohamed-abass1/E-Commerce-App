import 'package:e_commerece_app/features/ui/pages/home_screen/HomeScreenStates.dart';
import 'package:e_commerece_app/features/ui/pages/home_screen/tabs/products_tab/ProductTabViewModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/intities/FavouriteResponseEntity.dart';

class HomeScreenViewModel extends Cubit<HomeScreenStates> {
  HomeScreenViewModel() :super(HomeScreenInitialState());
  TextEditingController searchText = TextEditingController(text: '');
  List<FavouriteDataEntity>searchList = [];

  static HomeScreenViewModel get(context) => BlocProvider.of(context);

  void searching(String searchText, BuildContext context) {
    searchList.clear();
    final products = ProductViewModel
        .get(context)
        .productsList;

    searchList = products.where((e) =>
    (e.title?.toLowerCase() ?? '').contains(searchText.toLowerCase()) ||
        (e.description?.toLowerCase() ?? '').contains(searchText.toLowerCase())
    ).toList();

    print('search list: ${searchList.length}');
    print('Product list: ${products.length}');

    emit(HomeScreenSearchState());
  }
}