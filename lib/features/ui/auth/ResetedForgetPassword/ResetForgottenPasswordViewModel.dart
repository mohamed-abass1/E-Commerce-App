import 'package:e_commerece_online_c13/core/cach/SharedPrefrence.dart';
import 'package:e_commerece_online_c13/domain/use_case/SendResetPasswordUseCase.dart';
import 'package:e_commerece_online_c13/domain/use_case/logInUseCase.dart';
import 'package:e_commerece_online_c13/features/ui/auth/login/logInViewModelStates.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../domain/use_case/ResetForgottenPasswordUseCase.dart';
import 'ResetForgottenPasswordStates.dart';
@injectable
class ResetForgottenPasswordViewModel extends Cubit<ResetForgottenPasswordState>{
  ResetForgottenPasswordUseCase sendResetPasswordUseCase;
  var formKey = GlobalKey<FormState>();
  TextEditingController EmailController = TextEditingController(text: '');
  TextEditingController PasswordController = TextEditingController(text: '');
  ResetForgottenPasswordViewModel({required this.sendResetPasswordUseCase}): super(ResetForgottenPasswordInitialState());
  void logIn()async{
    if(formKey.currentState?.validate()==true) {
      emit(ResetForgottenPasswordLoadingState());
      var either =await sendResetPasswordUseCase.invoke(EmailController.text,PasswordController.text);
      either.fold((Error) =>emit(ResetForgottenPasswordErrorState(errorMsg: Error.ErrorMsg)) ,
              (response) =>
                  emit(
                    ResetForgottenPasswordSuccessState(responseEntity: response,),));
    }
  }

}