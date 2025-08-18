
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../domain/use_case/ChangePasswordUseCase.dart';
import 'changePasswordViewModelStates.dart';
@injectable
class changePasswordViewModel extends Cubit<changePasswordStates>{
  ChangePasswordUseCase changePasswordUseCase;
  var formKey = GlobalKey<FormState>();
  TextEditingController oldPasswordController = TextEditingController(text: '');
  TextEditingController newPasswordController = TextEditingController(text: '');
  TextEditingController rePasswordController = TextEditingController(text: '');

  changePasswordViewModel({required this.changePasswordUseCase}): super(changePasswordInitialState());
  void changePassword()async{
    if(formKey.currentState?.validate()==true) {
      emit(changePasswordLoadingState());
      var either =await changePasswordUseCase.invoke(
          oldPasswordController.text, newPasswordController.text,rePasswordController.text);
      either.fold((Error) =>emit(changePasswordErrorState(errorMsg: Error.ErrorMsg)) ,
              (response) =>
                  emit(
                    changePasswordSuccessState(responseEntity: response,),));
    }
  }

}