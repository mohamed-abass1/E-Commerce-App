import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../core/failers/failers.dart';
import '../../domain/intities/ResetForgottenPasswordResponseEntity.dart';
import '../../domain/repositories/data_source/ResetForgottenPasswordDataSource.dart';
import '../../domain/repositories/repositories/ResetForgottenPasswordRepositories.dart';
import '../../domain/repositories/repositories/logInRepositories.dart';
@Injectable(as: ResetForgottenPasswordRepositories)
class ResetForgottenPasswordRepositoriesImpl implements ResetForgottenPasswordRepositories {
  ResetForgottenPasswordDataSource logInDataSource;
  ResetForgottenPasswordRepositoriesImpl({required this.logInDataSource});
  @override
  Future<Either<Failers, ResetForgottenPasswordResponseEntity>> ResetForgottenPassword(String email,
      String password) async {
  var either=await logInDataSource.ResetForgottenPassword(email, password);
  return either.fold((error) => (left(error)), (response) => (right(response)));
  }
}