import 'package:dartz/dartz.dart';

import '../../../core/failers/failers.dart';
import '../../intities/RegisterResponse.dart';

abstract class AuthDataSource{
 Future <Either<Failers,RegisterResponseEntity>>
 register(String name,String email,String password,String rePassword,String phone);
}
