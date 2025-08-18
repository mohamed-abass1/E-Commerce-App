import 'package:dartz/dartz.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/failers/failers.dart';
import '../../../../../../domain/intities/categoryResponse.dart';
import '../../../../../../domain/use_case/brandUseCase.dart';
import '../../../../../../domain/use_case/categoryUseCase.dart';
import 'homeTabStates.dart';

@injectable
class HomeTabViewModel extends Cubit<HomeTabStates> {
  HomeTabViewModel({required this.categoryUseCase,required this.brandyUseCase}):super(HomeTabInitialState());
  CategoryUseCase categoryUseCase;
  BrandyUseCase brandyUseCase;
  List<CategoryEntity> categoryList=[];
  List<CategoryEntity> brandsList=[];

 void getCategory() async {
    emit(HomeTabLoadingState());
    var response=await categoryUseCase.invoke();
    response.fold((error) {
       Failers(ErrorMsg: error.ErrorMsg);
    }, (response) { categoryList=response.data!;
      emit(HomeTabSuccessState(responseEntity: response));
    }
    );  }



  void getBrands() async {
    emit(BrandLoadingState());
    var response=await brandyUseCase.invoke();
    response.fold((error) {
     ;
      emit(BrandErrorState(errorMsg: error.ErrorMsg));
    }, (response) { brandsList=response.data!;
    emit(BrandSuccessState(responseEntity: response));
    }
    );  }

  }
