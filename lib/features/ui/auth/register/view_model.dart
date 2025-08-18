import 'package:bloc/bloc.dart';
import 'package:e_commerece_online_c13/core/failers/failers.dart';
import 'package:e_commerece_online_c13/data/model/RegisterResponse.dart';
import 'package:e_commerece_online_c13/domain/intities/RegisterResponse.dart';
import 'package:e_commerece_online_c13/domain/use_case/RegisterUseCase.dart';
import 'package:e_commerece_online_c13/features/ui/auth/register/registerScreenStates/registerScreenStates.dart';
import 'package:flutter/cupertino.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
@injectable
class RegisterScreenViewModel extends Cubit<RegisterScreenStates>{
  RegisterUseCase registerUseCase;
  var formKey = GlobalKey<FormState>();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController mailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController rePasswordController = TextEditingController();
  RegisterScreenViewModel({required this.registerUseCase}):super(InitialRegisterScreen());

void register() async {

  if (formKey.currentState?.validate() == true) {
    emit(LoadingRegisterScreen());
    var either = await registerUseCase.invoke(
        fullNameController.text,
        mailController.text,
        passwordController.text,
        rePasswordController.text,
        phoneController.text);
    either.fold((error) {
      emit(ErrorRegisterScreen(errorMsg:ServerError(ErrorMsg: error.ErrorMsg) ));
    }, (response) {
      emit(SuccessRegisterScreen( registerResponseEntity: RegisterResponseEntity()));
    });
  }
}
}