import 'package:dartz/dartz.dart';
import 'package:e_commerece_online_c13/core/failers/failers.dart';
import 'package:e_commerece_online_c13/domain/intities/ChangePasswordResponseEntity.dart';
import 'package:e_commerece_online_c13/domain/intities/logInResponseEntity.dart';
import 'package:e_commerece_online_c13/domain/repositories/data_source/AddLocationDataSource.dart';
import 'package:e_commerece_online_c13/domain/repositories/data_source/logInDataSource.dart';
import 'package:injectable/injectable.dart';
import '../../domain/intities/AddLocationResponseEntity.dart';
import '../../domain/repositories/data_source/ChangePasswordDataSource.dart';
import '../../domain/repositories/repositories/AddLocationRepositories.dart';
import '../../domain/repositories/repositories/ChangePasswordRepositories.dart';
import '../../domain/repositories/repositories/logInRepositories.dart';
@Injectable(as: AddLocationRepositories)
class AddLocationRepositoriesImpl implements AddLocationRepositories {
  AddLocationDataSource   addLocationDataSource;
  AddLocationRepositoriesImpl({required this.addLocationDataSource});
  @override
  Future<Either<Failers, AddLocationResponseEntity>> AddLocation(String name,String details,String phone,String city) async {
  var either=await addLocationDataSource.AddLocation(name, details, phone, city);
  return either.fold((error) => (left(error)), (response) => (right(response)));
  }
}