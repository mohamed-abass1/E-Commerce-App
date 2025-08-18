import 'package:dartz/dartz.dart';
import '../../../core/failers/failers.dart';
import '../../intities/logInResponseEntity.dart';

abstract class LogInDataSource{
  Future<Either<Failers,LogInResponseEntity>>logIn(String email,String password);
}