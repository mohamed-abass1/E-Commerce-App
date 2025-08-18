import 'package:dartz/dartz.dart';
import 'package:e_commerece_online_c13/core/failers/failers.dart';
import 'package:e_commerece_online_c13/domain/intities/ChangePasswordResponseEntity.dart';
import 'package:e_commerece_online_c13/domain/intities/logInResponseEntity.dart';
import 'package:e_commerece_online_c13/domain/repositories/repositories/logInRepositories.dart';
import 'package:injectable/injectable.dart';

import '../repositories/repositories/ChangePasswordRepositories.dart';
@injectable
class ChangePasswordUseCase{
  ChangePasswordRepositories changePasswordRepositories;
  ChangePasswordUseCase({required this.changePasswordRepositories});

  Future<Either<Failers, ChangePasswordResponseEntity>> invoke(oldPassword, newPassword,rePassword)async{
    return await changePasswordRepositories.ChangePassword(oldPassword, newPassword,rePassword);}
}     