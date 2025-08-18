import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../core/api/api_manger.dart';
import '../../core/failers/failers.dart';
import '../../domain/intities/ResetForgottenPasswordResponseEntity.dart';
import '../../domain/repositories/data_source/ResetForgottenPasswordDataSource.dart';
import '../model/ResetForgottenPasswordResponseDM.dart';
@Injectable(as:ResetForgottenPasswordDataSource )
class ResetForgottenPasswordDataSourceImpl implements ResetForgottenPasswordDataSource{
  ApiManger apiManger;
  ResetForgottenPasswordDataSourceImpl({required this.apiManger});
  @override
  Future<Either<Failers, ResetForgottenPasswordResponseEntity>> ResetForgottenPassword(String email, String password)async {
    try {
      final List<ConnectivityResult> connectivityResult = await (Connectivity()
          .checkConnectivity());
      if (connectivityResult.contains(ConnectivityResult.mobile) ||
          connectivityResult.contains(ConnectivityResult.wifi)) {
        var response = await apiManger.resetForgottenPassword(email, password);
        var logInResponse = ResetForgottenPasswordResponseDm.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return right(logInResponse);
        }
        else {
          return left(ServerError(ErrorMsg:'Error'));
        }
      }
      else {
        return left(ClientError(ErrorMsg: 'please check your internet'));
      }
    }catch(e){return left(ServerError(ErrorMsg: e.toString()));}
  }

}