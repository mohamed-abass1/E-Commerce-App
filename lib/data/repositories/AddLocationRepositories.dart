import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../core/failers/failers.dart';
import '../../domain/intities/AddLocationResponseEntity.dart';
import '../../domain/repositories/data_source/AddLocationDataSource.dart';
import '../../domain/repositories/repositories/AddLocationRepositories.dart';
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