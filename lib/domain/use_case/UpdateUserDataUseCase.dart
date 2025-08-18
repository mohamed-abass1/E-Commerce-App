import 'package:dartz/dartz.dart';
import 'package:e_commerece_online_c13/core/failers/failers.dart';
import 'package:e_commerece_online_c13/domain/intities/UpdateUserDataResponseEntity.dart';
import 'package:e_commerece_online_c13/domain/intities/logInResponseEntity.dart';
import 'package:e_commerece_online_c13/domain/repositories/repositories/logInRepositories.dart';
import 'package:injectable/injectable.dart';

import '../repositories/repositories/UpdateUserDataRepositories.dart';
@injectable
class UpdateUserDataUseCase{
  UpdateUserDataRepositories UpdateUserRepositories;
  UpdateUserDataUseCase({required this.UpdateUserRepositories});

  Future<Either<Failers, UpdateUserDataResponseEntity>> invoke(String name,String email,String phone)async{
    return await UpdateUserRepositories.UpdateUser(name, email,phone);}
}     