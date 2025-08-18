import 'package:dartz/dartz.dart';
import 'package:e_commerece_online_c13/core/failers/failers.dart';
import 'package:e_commerece_online_c13/domain/intities/logInResponseEntity.dart';
import 'package:e_commerece_online_c13/domain/repositories/repositories/logInRepositories.dart';
import 'package:injectable/injectable.dart';
@injectable
class LogInUseCase{
  LogInRepositories logInRepositories;
  LogInUseCase({required this.logInRepositories});

  Future<Either<Failers,LogInResponseEntity>> invoke(String email,String password)async{
    return await logInRepositories.logIn(email, password);}
}     