import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerece_online_c13/core/api/api_manger.dart';
import 'package:e_commerece_online_c13/core/failers/failers.dart';
import 'package:e_commerece_online_c13/data/model/RegisterResponse.dart';

import 'package:e_commerece_online_c13/domain/intities/RegisterResponse.dart';
import 'package:injectable/injectable.dart';
import '../../domain/repositories/data_source/remoteDataSource.dart';
@Injectable(as: AuthDataSource)
class AuthDataSourceImpl implements AuthDataSource {
  ApiManger apiManger;

  AuthDataSourceImpl({required this.apiManger});

  @override
  Future<Either<Failers, AuthResponseDto>> register(String name, String email,
      String password, String rePassword, String phone) async {
    try {
      final List<ConnectivityResult> connectivityResult = await (Connectivity()
          .checkConnectivity());
      if (connectivityResult.contains(ConnectivityResult.mobile) ||
          connectivityResult.contains(ConnectivityResult.wifi)) {
        var Response = await apiManger.getDataRegister(
            name, email, password, rePassword, phone);
        var AuthResponse = AuthResponseDto.fromJson(Response.data);
        if (Response.statusCode! >= 200 && Response.statusCode! < 300) {
          return Right(AuthResponse);
        }
        else {
          return left(ServerError(ErrorMsg: AuthResponse.message!));
        }
      } else {
        return Left(ClientError(ErrorMsg: 'please check toy internet'));
      }
    } catch (e) {
      print(e);
      return Left(
          ServerError(ErrorMsg: e.toString())
      );
    }
  }
}



