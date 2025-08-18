import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../core/failers/failers.dart';
import '../../domain/intities/UpdateUserDataResponseEntity.dart';
import '../../domain/repositories/data_source/UpdateUserDataSource.dart';
import '../../domain/repositories/repositories/UpdateUserDataRepositories.dart';
import '../../domain/repositories/repositories/logInRepositories.dart';
@Injectable(as: UpdateUserDataRepositories)
class UpdateUserDataRepositoriesImpl implements UpdateUserDataRepositories {
  UpdateUserDataSource logInDataSource;
  UpdateUserDataRepositoriesImpl({required this.logInDataSource});
  @override
  Future<Either<Failers, UpdateUserDataResponseEntity>> UpdateUser(String name,String email,String phone) async {
  var either=await logInDataSource.UpdateUser(name, email,phone);
  return either.fold((error) => (left(error)), (response) => (right(response)));
  }
}