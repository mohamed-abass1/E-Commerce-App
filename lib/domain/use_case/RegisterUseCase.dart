import 'package:dartz/dartz.dart';
import 'package:e_commerece_online_c13/core/failers/failers.dart';
import 'package:e_commerece_online_c13/domain/repositories/data_source/remoteDataSource.dart';
import 'package:e_commerece_online_c13/domain/repositories/repositories/Repositories.dart';
import 'package:injectable/injectable.dart';

import '../intities/RegisterResponse.dart';
@injectable
class RegisterUseCase{
  AuthRepositories authRepositories;
  RegisterUseCase({required this.authRepositories});

  Future <Either<Failers, RegisterResponseEntity>> invoke
      (String name,String email,String password,String rePassword,String phone) async {
    return authRepositories.register(name, email, password, rePassword, phone);
  }
}