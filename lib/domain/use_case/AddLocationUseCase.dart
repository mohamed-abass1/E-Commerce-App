import 'package:dartz/dartz.dart';
import 'package:e_commerece_online_c13/core/failers/failers.dart';
import 'package:e_commerece_online_c13/domain/intities/AddLocationResponseEntity.dart';
import 'package:e_commerece_online_c13/domain/intities/ChangePasswordResponseEntity.dart';
import 'package:e_commerece_online_c13/domain/intities/logInResponseEntity.dart';
import 'package:e_commerece_online_c13/domain/repositories/repositories/logInRepositories.dart';
import 'package:injectable/injectable.dart';

import '../repositories/repositories/AddLocationRepositories.dart';
import '../repositories/repositories/ChangePasswordRepositories.dart';
@injectable
class AddLocationUseCase{
 AddLocationRepositories addLocationRepositories;
  AddLocationUseCase({required this.addLocationRepositories});

  Future<Either<Failers, AddLocationResponseEntity>> invoke(String name,String details,String phone,String city)async{
    return await addLocationRepositories.AddLocation(name, details, phone, city);}
}     