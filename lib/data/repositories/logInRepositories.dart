import 'package:dartz/dartz.dart';
import 'package:e_commerece_online_c13/core/failers/failers.dart';
import 'package:e_commerece_online_c13/domain/intities/logInResponseEntity.dart';
import 'package:e_commerece_online_c13/domain/repositories/data_source/logInDataSource.dart';
import 'package:injectable/injectable.dart';
import '../../domain/repositories/repositories/logInRepositories.dart';
@Injectable(as: LogInRepositories)
class LogInRepositoriesImpl implements LogInRepositories {
  LogInDataSource logInDataSource;
  LogInRepositoriesImpl({required this.logInDataSource});
  @override
  Future<Either<Failers, LogInResponseEntity>> logIn(String email,
      String password) async {
  var either=await logInDataSource.logIn(email, password);
  return either.fold((error) => (left(error)), (response) => (right(response)));
  }
}