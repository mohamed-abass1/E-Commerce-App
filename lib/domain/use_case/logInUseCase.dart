import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../core/failers/failers.dart';
import '../intities/logInResponseEntity.dart';
import '../repositories/repositories/logInRepositories.dart';
@injectable
class LogInUseCase{
  LogInRepositories logInRepositories;
  LogInUseCase({required this.logInRepositories});

  Future<Either<Failers,LogInResponseEntity>> invoke(String email,String password)async{
    return await logInRepositories.logIn(email, password);}
}     