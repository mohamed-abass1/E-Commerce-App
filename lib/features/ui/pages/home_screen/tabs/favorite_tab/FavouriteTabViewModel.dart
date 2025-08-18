import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../domain/intities/FavouriteResponseEntity.dart';
import '../../../../../../domain/use_case/AddFavouriteUseCase.dart';
import '../../../../../../domain/use_case/FavouriteUseCase.dart';
import '../../../../../../domain/use_case/RemoveFavouriteUseCase.dart';
import 'FavouriteTabStates.dart';

@injectable
class FavouriteViewModel extends Cubit<FavouriteTabStates> {
  FavouriteUseCase getAllFavouriteUseCase;
  AddFavouriteUseCase addFavouriteUseCase;
  RemoveFavouriteUseCase removeFavouriteUseCase;
  List<String?>isFavourite=[];
  FavouriteViewModel(
      {required this.removeFavouriteUseCase,required this.getAllFavouriteUseCase, required this.addFavouriteUseCase})
      :super(FavouriteTabInitialState());

  List<FavouriteDataEntity> FavouriteList =[];
  static FavouriteViewModel get(context) => BlocProvider.of<FavouriteViewModel>(context);


  void addFavourites(String productId) async {
    emit(AddFavouriteLoadingState());
    var either = await addFavouriteUseCase.invoke(productId);
    getAllFavourites();
    either.fold((error) {
      emit(AddFavouriteErrorState( errorMsg: error.ErrorMsg));
    }, (response) {
      emit(AddFavouriteSuccessState(responseEntity: response));
    });
  }
  void getAllFavourites() async {
    emit(FavouriteLoadingState());
    var either = await getAllFavouriteUseCase.invoke();
    either.fold((error) {
      emit(FavouriteErrorState( errorMsg: error.ErrorMsg));
    }, (response) {
      FavouriteList = response.data!;
      emit(FavouriteSuccessState(responseEntity: response));
    });
  }

  void RemoveFavourites(String productId) async {
    emit(RemoveFavouriteLoadingState());
    var either = await removeFavouriteUseCase.invoke(productId);
    getAllFavourites();
    FavouriteList.removeWhere((item) => item.id == productId);
    either.fold((error) {
      emit(RemoveFavouriteErrorState( errorMsg: error.ErrorMsg));
    }, (response) {
      emit(RemoveFavouriteSuccessState(responseEntity: response));
    });
  }

  Widget checkIsFavourite(String productId,context,  List<FavouriteDataEntity> productList, int index){
    isFavourite.clear();
    FavouriteList.map((e) {
      if(productId==e.id){isFavourite.add(productId);}}).toList();
    if(isFavourite.contains(productId)){
      return Positioned(
    top: 8.h,
    right: 8.w,
    child: Container(
    decoration: BoxDecoration(
    shape: BoxShape.circle,
          boxShadow: [
          BoxShadow(
          color: Colors.black.withOpacity(0.2),
    blurRadius: 8,
    spreadRadius: 3,
    offset: Offset(1, 3),
    ),
    ],),
      child: CircleAvatar(
      backgroundColor: AppColors.whiteColor,
      radius: 20.r,
      child: Center(
      child:IconButton(
      onPressed: () {
        FavouriteViewModel.get(context).RemoveFavourites(productList[index].id!);
      },
      padding: EdgeInsets.zero,
      iconSize: 30.r,
      // Adjust icon size as needed
      icon:  Icon(
      Icons.favorite_rounded,
      color: AppColors.primaryColor,

      )),
      ),
      ),
    ));
    }
    else {
      return
      Positioned(
        top: 8.h,
        right: 8.w,
        child: Container(
        decoration: BoxDecoration(
        shape: BoxShape.circle,
          boxShadow: [
          BoxShadow(
          color: Colors.black.withOpacity(0.2),
    blurRadius: 8,
    spreadRadius: 3,
    offset: Offset(1, 3),
    ),
    ],),
          child: CircleAvatar(
            backgroundColor: AppColors.whiteColor,
            radius: 20.r,
            child: Center(
              child:IconButton(
                  onPressed: () {
                    FavouriteViewModel.get(context).addFavourites(productList[index].id!);
                  },
                  padding: EdgeInsets.zero,
                  iconSize: 30.r,
                  // Adjust icon size as needed
                  icon:  Icon(
                    Icons.favorite_border_rounded,
                    color: AppColors.primaryColor,
                  )),
            ),
          ),
        ));}
  }


}