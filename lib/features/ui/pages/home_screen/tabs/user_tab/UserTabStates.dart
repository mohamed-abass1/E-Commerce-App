
import '../../../../../../domain/intities/AddLocationResponseEntity.dart';
import '../../../../../../domain/intities/RemoveAdressResponseEntity.dart';
import '../../../../../../domain/intities/UpdateUserDataResponseEntity.dart';

abstract class UserTabStates{}
class UserTabInitialState extends UserTabStates{}
class UserErrorState extends UserTabStates{
  String errorMsg;
  UserErrorState({required this.errorMsg});
}
class UpdateUserInfoSuccessState extends UserTabStates{
  UpdateUserDataResponseEntity responseEntity;

  UpdateUserInfoSuccessState({required this.responseEntity});
}
class  UserLoadingState extends UserTabStates{}
class  AddLocationSuccessState extends UserTabStates{}
class  GetUserLocationsSuccessState extends UserTabStates{
  AddLocationResponseEntity responseEntity;
  GetUserLocationsSuccessState({required this.responseEntity});}
class  RemoveAddressLocationsSuccessState extends UserTabStates{
  RemoveAddressResponseEntity responseEntity;
  RemoveAddressLocationsSuccessState({required this.responseEntity});}

class  ChangeChosenLocationSuccessState extends UserTabStates{}



