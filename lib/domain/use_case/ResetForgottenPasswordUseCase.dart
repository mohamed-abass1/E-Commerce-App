import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../core/failers/failers.dart';
import '../intities/ResetForgottenPasswordResponseEntity.dart';
import '../repositories/repositories/ResetForgottenPasswordRepositories.dart';
@injectable
class ResetForgottenPasswordUseCase{
  ResetForgottenPasswordRepositories resetForgottenPasswordRepositories;
  ResetForgottenPasswordUseCase({required this.resetForgottenPasswordRepositories});

  Future<Either<Failers, ResetForgottenPasswordResponseEntity>> invoke(String email,String password)async{
    return await resetForgottenPasswordRepositories.ResetForgottenPassword(email, password);}
}     