import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../core/failers/failers.dart';
import '../intities/AddLocationResponseEntity.dart';
import '../repositories/repositories/AddLocationRepositories.dart';
import '../repositories/repositories/ChangePasswordRepositories.dart';
@injectable
class AddLocationUseCase{
 AddLocationRepositories addLocationRepositories;
  AddLocationUseCase({required this.addLocationRepositories});

  Future<Either<Failers, AddLocationResponseEntity>> invoke(String name,String details,String phone,String city)async{
    return await addLocationRepositories.AddLocation(name, details, phone, city);}
}     