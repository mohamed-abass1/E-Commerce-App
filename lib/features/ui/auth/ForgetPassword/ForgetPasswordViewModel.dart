import 'package:e_commerece_online_c13/core/cach/SharedPrefrence.dart';
import 'package:e_commerece_online_c13/domain/use_case/SendResetPasswordUseCase.dart';
import 'package:e_commerece_online_c13/domain/use_case/logInUseCase.dart';
import 'package:e_commerece_online_c13/features/ui/auth/login/logInViewModelStates.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'ForgetPasswordStates.dart';
@injectable
class ForgetPasswordViewModel extends Cubit<ForgetPasswordState>{
  SendResetPasswordUseCase sendResetPasswordUseCase;
  var formKey = GlobalKey<FormState>();
  TextEditingController userNameController = TextEditingController(text: '');
  ForgetPasswordViewModel({required this.sendResetPasswordUseCase}): super(ForgetPasswordInitialState());
  void logIn()async{
    if(formKey.currentState?.validate()==true) {
      emit(ForgetPasswordLoadingState());
      var either =await sendResetPasswordUseCase.invoke(
          userNameController.text);
      either.fold((Error) =>emit(ForgetPasswordErrorState(errorMsg: Error.ErrorMsg)) ,
              (response) =>
                  emit(
                    SendResetPasswordSuccessState(responseEntity: response,),));
    }
  }

}