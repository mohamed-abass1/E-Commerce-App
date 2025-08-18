import 'package:dartz/dartz.dart';
import 'package:e_commerece_online_c13/core/failers/failers.dart';
import 'package:e_commerece_online_c13/domain/intities/SendResetPasswordResponseEntity.dart';
import 'package:e_commerece_online_c13/domain/intities/logInResponseEntity.dart';
import 'package:e_commerece_online_c13/domain/repositories/repositories/logInRepositories.dart';
import 'package:injectable/injectable.dart';

import '../repositories/repositories/SendResetPasswordRepositories.dart';
@injectable
class SendResetPasswordUseCase{
  SendResetPasswordRepositories sendResetCodeRepositories;
  SendResetPasswordUseCase({required this.sendResetCodeRepositories});

  Future<Either<Failers, SendResetPasswordResponseEntity>> invoke(String email)async{
    return await sendResetCodeRepositories.SendResetPassword(email);}
}     