
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../../../../../domain/use_case/AddLocationUseCase.dart';
import 'AddLocationViewModelStates.dart';
@injectable
class AddLocationViewModel extends Cubit<AddLocationStates>{
  AddLocationUseCase addLocationUseCase;
  var formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController(text: 'mohamed abass');
  TextEditingController detailsController = TextEditingController(text: 'agamy');
  TextEditingController phoneController = TextEditingController(text: '01205408261');
  TextEditingController cityController = TextEditingController(text: 'alexandria');

  AddLocationViewModel({required this.addLocationUseCase}): super(AddLocationInitialState());

  void addLocation()async{

    if(formKey.currentState?.validate()==true) {
      emit(AddLocationLoadingState());
      var either =await addLocationUseCase.invoke(nameController.text,
          detailsController.text,
          phoneController.text,
          cityController.text
        );
      either.fold((Error) =>emit(AddLocationErrorState(errorMsg: Error.ErrorMsg)) ,
              (response) =>
                  emit(
                    AddLocationSuccessState(responseEntity: response,),));
    }
  }

}