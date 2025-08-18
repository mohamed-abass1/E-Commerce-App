import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../core/failers/failers.dart';
import '../intities/ChangePasswordResponseEntity.dart';
import '../repositories/repositories/ChangePasswordRepositories.dart';
@injectable
class ChangePasswordUseCase{
  ChangePasswordRepositories changePasswordRepositories;
  ChangePasswordUseCase({required this.changePasswordRepositories});

  Future<Either<Failers, ChangePasswordResponseEntity>> invoke(oldPassword, newPassword,rePassword)async{
    return await changePasswordRepositories.ChangePassword(oldPassword, newPassword,rePassword);}
}     