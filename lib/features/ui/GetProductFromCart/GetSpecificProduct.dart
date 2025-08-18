

import '../../../domain/intities/GetSpecificProduct.dart';

class GetSpecificProductState{}
class GetSpecificProductErrorState extends GetSpecificProductState{
  String errorMessage;
  GetSpecificProductErrorState({required this.errorMessage});
}
class GetSpecificProductDownload extends GetSpecificProductState{}
class GetSpecificProductSuccessState extends GetSpecificProductState{
  GetSpecificProductResponseEntity getSpecificProductResponseEntity;
  GetSpecificProductSuccessState({required this.getSpecificProductResponseEntity});
}
