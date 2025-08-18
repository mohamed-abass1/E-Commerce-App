import 'package:dartz/dartz.dart';
import 'package:e_commerece_online_c13/core/failers/failers.dart';
import 'package:e_commerece_online_c13/domain/intities/SendResetPasswordResponseEntity.dart';
import 'package:e_commerece_online_c13/domain/intities/VerifyCodeResponseEntity.dart';
import 'package:e_commerece_online_c13/domain/intities/logInResponseEntity.dart';
import 'package:e_commerece_online_c13/domain/repositories/repositories/logInRepositories.dart';
import 'package:injectable/injectable.dart';

import '../repositories/repositories/SendResetPasswordRepositories.dart';
import '../repositories/repositories/VerifyCodeRepositories.dart';
@injectable
class VerifyCodeUseCase{
  VerifyCodeRepositories verifyCode;
  VerifyCodeUseCase({required this.verifyCode});

  Future<Either<Failers, VerifyCodeResponseEntity>> invoke(String code)async{
    return await verifyCode.VerifyCode(code);}
}