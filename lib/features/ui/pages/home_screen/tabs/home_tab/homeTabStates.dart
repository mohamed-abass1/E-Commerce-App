import 'package:e_commerece_online_c13/domain/intities/categoryResponse.dart';

abstract class HomeTabStates{}
class  HomeTabInitialState extends HomeTabStates{}

class HomeTabErrorState extends HomeTabStates{
  String errorMsg;
  HomeTabErrorState({required this.errorMsg});
}
class  HomeTabSuccessState extends HomeTabStates{
  CategoryResponseEntity responseEntity;

  HomeTabSuccessState({required this.responseEntity});
}
class  HomeTabLoadingState extends HomeTabStates{}
class BrandErrorState extends HomeTabStates{
  String errorMsg;
  BrandErrorState({required this.errorMsg});
}
class BrandSuccessState extends HomeTabStates{
  CategoryResponseEntity responseEntity;

  BrandSuccessState({required this.responseEntity});
}
class  BrandLoadingState extends HomeTabStates{}