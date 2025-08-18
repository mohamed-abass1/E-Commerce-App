import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerece_online_c13/core/api/api_manger.dart';
import 'package:e_commerece_online_c13/core/failers/failers.dart';
import 'package:e_commerece_online_c13/data/model/SendResetPasswordResponseDM.dart';
import 'package:e_commerece_online_c13/data/model/logInResponseDTO.dart';
import 'package:e_commerece_online_c13/domain/intities/logInResponseEntity.dart';
import 'package:e_commerece_online_c13/domain/repositories/data_source/SendResetPasswordDataSource.dart';
import 'package:e_commerece_online_c13/domain/repositories/data_source/logInDataSource.dart';
import 'package:injectable/injectable.dart';

import '../../domain/intities/SendResetPasswordResponseEntity.dart';
import '../../domain/intities/VerifyCodeResponseEntity.dart';
import '../../domain/repositories/data_source/VerifyCodeDataSource.dart';
import '../model/VerifyCodeResponseDM.dart';
@Injectable(as:VerifyCodeDataSource )
class VerifyCodeDataSourceImpl implements VerifyCodeDataSource{
  ApiManger apiManger;
  VerifyCodeDataSourceImpl({required this.apiManger});
  @override
  Future<Either<Failers, VerifyCodeResponseEntity>> VerifyCode(String code)async {
    try {
      final List<ConnectivityResult> connectivityResult = await (Connectivity()
          .checkConnectivity());
      if (connectivityResult.contains(ConnectivityResult.mobile) ||
          connectivityResult.contains(ConnectivityResult.wifi)) {
        var response = await apiManger.verifyCode(code);
        var logInResponse = VerifyCodeResponseDm.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return right(logInResponse);
        }
        else {
          return left(ServerError(ErrorMsg: 'Not Correct'));
        }
      }
      else {
        return left(ClientError(ErrorMsg: 'please check your internet'));
      }
    }catch(e){return left(ServerError(ErrorMsg: e.toString()));}
  }

}