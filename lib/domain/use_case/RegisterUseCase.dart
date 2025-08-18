import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../core/failers/failers.dart';
import '../intities/RegisterResponse.dart';
import '../repositories/repositories/Repositories.dart';
@injectable
class RegisterUseCase{
  AuthRepositories authRepositories;
  RegisterUseCase({required this.authRepositories});

  Future <Either<Failers, RegisterResponseEntity>> invoke
      (String name,String email,String password,String rePassword,String phone) async {
    return authRepositories.register(name, email, password, rePassword, phone);
  }
}