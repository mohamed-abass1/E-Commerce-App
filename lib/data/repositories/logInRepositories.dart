import 'package:dartz/dartz.dart';

import 'package:injectable/injectable.dart';
import '../../core/failers/failers.dart';
import '../../domain/intities/logInResponseEntity.dart';
import '../../domain/repositories/data_source/logInDataSource.dart';
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