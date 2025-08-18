import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../core/failers/failers.dart';
import '../intities/SendResetPasswordResponseEntity.dart';
import '../repositories/repositories/SendResetPasswordRepositories.dart';
@injectable
class SendResetPasswordUseCase{
  SendResetPasswordRepositories sendResetCodeRepositories;
  SendResetPasswordUseCase({required this.sendResetCodeRepositories});

  Future<Either<Failers, SendResetPasswordResponseEntity>> invoke(String email)async{
    return await sendResetCodeRepositories.SendResetPassword(email);}
}     