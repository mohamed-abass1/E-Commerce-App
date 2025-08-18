import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../core/failers/failers.dart';
import '../intities/UpdateUserDataResponseEntity.dart';
import '../repositories/repositories/UpdateUserDataRepositories.dart';
@injectable
class UpdateUserDataUseCase{
  UpdateUserDataRepositories UpdateUserRepositories;
  UpdateUserDataUseCase({required this.UpdateUserRepositories});

  Future<Either<Failers, UpdateUserDataResponseEntity>> invoke(String name,String email,String phone)async{
    return await UpdateUserRepositories.UpdateUser(name, email,phone);}
}     