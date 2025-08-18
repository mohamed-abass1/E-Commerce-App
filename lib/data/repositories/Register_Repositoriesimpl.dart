import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../core/failers/failers.dart';
import '../../domain/intities/RegisterResponse.dart';
import '../../domain/repositories/data_source/remoteDataSource.dart';
import '../../domain/repositories/repositories/Repositories.dart';
@Injectable(as: AuthRepositories)
class AuthRepositoryImpl implements AuthRepositories {
  AuthDataSource authRemoteDataSource;

  AuthRepositoryImpl({required this.authRemoteDataSource});

  @override
  Future<Either<Failers, RegisterResponseEntity>> register(String name, String email, String password, String rePassword, String phone) async {
    var either = await authRemoteDataSource.register(
        name, email, password, rePassword, phone);
    return either.fold((error) => Left(error), (response) => Right(response));
  }



}

