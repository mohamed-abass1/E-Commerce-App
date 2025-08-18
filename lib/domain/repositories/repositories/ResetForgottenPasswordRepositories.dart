import 'package:dartz/dartz.dart';

import '../../../core/failers/failers.dart';
import '../../intities/ResetForgottenPasswordResponseEntity.dart';


abstract class ResetForgottenPasswordRepositories{
  Future<Either<Failers,ResetForgottenPasswordResponseEntity>> ResetForgottenPassword(String email,String password);


}