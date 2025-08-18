import 'package:dartz/dartz.dart';
import 'package:e_commerece_online_c13/core/failers/failers.dart';
import 'package:e_commerece_online_c13/domain/intities/VerifyCodeResponseEntity.dart';
import 'package:e_commerece_online_c13/domain/intities/logInResponseEntity.dart';
import 'package:e_commerece_online_c13/domain/repositories/data_source/logInDataSource.dart';
import 'package:injectable/injectable.dart';
import '../../domain/intities/SendResetPasswordResponseEntity.dart';
import '../../domain/repositories/data_source/SendResetPasswordDataSource.dart';
import '../../domain/repositories/data_source/VerifyCodeDataSource.dart';
import '../../domain/repositories/repositories/SendResetPasswordRepositories.dart';
import '../../domain/repositories/repositories/VerifyCodeRepositories.dart';
import '../../domain/repositories/repositories/logInRepositories.dart';
@Injectable(as: VerifyCodeRepositories)
class VerifyCodeRepositoriesImpl implements VerifyCodeRepositories {
  VerifyCodeDataSource verifyCode;
  VerifyCodeRepositoriesImpl({required this.verifyCode});
  @override
  Future<Either<Failers, VerifyCodeResponseEntity>> VerifyCode(String code,) async {
  var either=await verifyCode.VerifyCode(code);
  return either.fold((error) => (left(error)), (response) => (right(response)));
  }
}