import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../core/failers/failers.dart';
import '../../domain/intities/ChangePasswordResponseEntity.dart';
import '../../domain/repositories/data_source/ChangePasswordDataSource.dart';
import '../../domain/repositories/repositories/ChangePasswordRepositories.dart';
import '../../domain/repositories/repositories/logInRepositories.dart';
@Injectable(as: ChangePasswordRepositories)
class ChangePasswordRepositoriesImpl implements ChangePasswordRepositories {
  ChangePasswordDataSource changePasswordDataSource;
  ChangePasswordRepositoriesImpl({required this.changePasswordDataSource});
  @override
  Future<Either<Failers, ChangePasswordResponseEntity>> ChangePassword(String oldPassword,String newPassword,String rePassword) async {
  var either=await changePasswordDataSource.ChangePassword(oldPassword, newPassword, rePassword);
  return either.fold((error) => (left(error)), (response) => (right(response)));
  }
}