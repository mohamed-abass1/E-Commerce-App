import 'package:e_commerece_online_c13/core/cach/SharedPrefrence.dart';
import 'package:e_commerece_online_c13/domain/use_case/logInUseCase.dart';
import 'package:e_commerece_online_c13/features/ui/auth/login/logInViewModelStates.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../domain/use_case/VerifyCodeUseCase.dart';
import 'VerifyCodeStates.dart';
@injectable
class VerifyCodeViewModel extends Cubit<VerifyCodeState>{
  VerifyCodeUseCase verifyCode;
  var formKey = GlobalKey<FormState>();
  TextEditingController codeController = TextEditingController();
  VerifyCodeViewModel({required this.verifyCode}): super(VerifyCodeInitialState());
  void VerifyCode()async{
    if(formKey.currentState?.validate()==true) {
      emit(VerifyCodeLoadingState());
      var either =await verifyCode.invoke(codeController.text);
      either.fold((Error) =>emit(VerifyCodeErrorState(errorMsg: Error.ErrorMsg)) ,
              (response) =>
                  emit(
                    VerifyCodeSuccessState(responseEntity: response),));
    }
  }

}