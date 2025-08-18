
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/use_case/GetSpecificProductUseCase.dart';
import 'GetSpecificProduct.dart';
@injectable
class GetSpecificProductViewModel extends Cubit<GetSpecificProductState>{
  GetSpecificProductUseCase getSpecificProductUseCase;
  GetSpecificProductViewModel({required this.getSpecificProductUseCase}):super(GetSpecificProductDownload());
  static GetSpecificProductViewModel get(context) => BlocProvider.of<GetSpecificProductViewModel>(context);

  Future<void> GetSpecificProduct(String id)async {
    print('id $id');
    emit(GetSpecificProductDownload());
  var either=await  getSpecificProductUseCase.invoke(id);
  either.fold((l) {
  emit(GetSpecificProductErrorState(errorMessage: l.ErrorMsg));} , (r) =>emit(GetSpecificProductSuccessState(getSpecificProductResponseEntity: r)),);

  }
}