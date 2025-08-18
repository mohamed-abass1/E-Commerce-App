import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../core/failers/failers.dart';
import '../intities/VerifyCodeResponseEntity.dart';
import '../repositories/repositories/SendResetPasswordRepositories.dart';
import '../repositories/repositories/VerifyCodeRepositories.dart';
@injectable
class VerifyCodeUseCase{
  VerifyCodeRepositories verifyCode;
  VerifyCodeUseCase({required this.verifyCode});

  Future<Either<Failers, VerifyCodeResponseEntity>> invoke(String code)async{
    return await verifyCode.VerifyCode(code);}
}