
import '../../../../../../../../domain/intities/AddLocationResponseEntity.dart';


abstract class AddLocationStates{}
class  AddLocationInitialState extends AddLocationStates{}
class  AddLocationErrorState extends AddLocationStates{
  String errorMsg;
  AddLocationErrorState({required this.errorMsg});
}
class  AddLocationSuccessState extends AddLocationStates{
  AddLocationResponseEntity responseEntity;

  AddLocationSuccessState({required this.responseEntity});
}
class  AddLocationLoadingState extends AddLocationStates{}