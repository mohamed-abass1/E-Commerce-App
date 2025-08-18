import 'package:dartz/dartz.dart';
import 'package:e_commerece_online_c13/core/failers/failers.dart';
import 'package:e_commerece_online_c13/domain/intities/ResetForgottenPasswordResponseEntity.dart';
import 'package:e_commerece_online_c13/domain/intities/logInResponseEntity.dart';
import 'package:e_commerece_online_c13/domain/repositories/repositories/logInRepositories.dart';
import 'package:injectable/injectable.dart';

import '../repositories/repositories/ResetForgottenPasswordRepositories.dart';
@injectable
class ResetForgottenPasswordUseCase{
  ResetForgottenPasswordRepositories resetForgottenPasswordRepositories;
  ResetForgottenPasswordUseCase({required this.resetForgottenPasswordRepositories});

  Future<Either<Failers, ResetForgottenPasswordResponseEntity>> invoke(String email,String password)async{
    return await resetForgottenPasswordRepositories.ResetForgottenPassword(email, password);}
}     