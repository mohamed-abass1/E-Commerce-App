import 'package:e_commerece_online_c13/core/failers/failers.dart';
import 'package:e_commerece_online_c13/domain/use_case/GetSpecificProductUseCase.dart';
import 'package:e_commerece_online_c13/features/ui/GetProductFromCart/GetSpecificProduct.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
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