import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../core/failers/failers.dart';
import '../../domain/intities/SendResetPasswordResponseEntity.dart';
import '../../domain/repositories/data_source/SendResetPasswordDataSource.dart';
import '../../domain/repositories/repositories/SendResetPasswordRepositories.dart';
import '../../domain/repositories/repositories/logInRepositories.dart';
@Injectable(as: SendResetPasswordRepositories)
class SendResetPasswordRepositoriesImpl implements SendResetPasswordRepositories {
  SendResetPasswordDataSource sendResetPasswordDataSource;
  SendResetPasswordRepositoriesImpl({required this.sendResetPasswordDataSource});
  @override
  Future<Either<Failers, SendResetPasswordResponseEntity>> SendResetPassword(String email,) async {
  var either=await sendResetPasswordDataSource.SendResetPassword(email, );
  return either.fold((error) => (left(error)), (response) => (right(response)));
  }
}