import 'package:dartz/dartz.dart';
import 'package:e_commerece_online_c13/core/failers/failers.dart';
import 'package:e_commerece_online_c13/domain/intities/RegisterResponse.dart';

abstract class AuthDataSource{
 Future <Either<Failers,RegisterResponseEntity>>
 register(String name,String email,String password,String rePassword,String phone);
}
