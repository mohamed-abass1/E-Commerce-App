import 'package:e_commerece_online_c13/domain/use_case/logInUseCase.dart';
import 'package:e_commerece_online_c13/features/ui/auth/login/logInViewModelStates.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
@injectable
class LogInViewModel extends Cubit<LogInStates>{
  LogInUseCase logInUseCase;
  var formKey = GlobalKey<FormState>();
  TextEditingController userNameController = TextEditingController(text: '');
  TextEditingController passwordController = TextEditingController(text: '');
  LogInViewModel({required this.logInUseCase}): super(LogInInitialState());
  void logIn()async{
    if(formKey.currentState?.validate()==true) {
      emit(LogInLoadingState());
      var either =await logInUseCase.invoke(
          userNameController.text, passwordController.text);
      either.fold((Error) =>emit(LogInErrorState(errorMsg: Error.ErrorMsg)) ,
              (response) =>
                  emit(
                    LogInSuccessState(responseEntity: response,),));
    }
  }

}