import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../core/api/api_manger.dart';
import '../../core/failers/failers.dart';
import '../../domain/intities/ChangePasswordResponseEntity.dart';
import '../../domain/repositories/data_source/ChangePasswordDataSource.dart';
import '../model/ChangePasswordResponseDm.dart';
@Injectable(as:ChangePasswordDataSource )
class ChangePasswordDataSourceImpl implements ChangePasswordDataSource{
  ApiManger apiManger;
  ChangePasswordDataSourceImpl({required this.apiManger});
  @override
  Future<Either<Failers, ChangePasswordResponseEntity>> ChangePassword(String oldPassword,String newPassword,String rePassword)async {
      final List<ConnectivityResult> connectivityResult = await (Connectivity()
          .checkConnectivity());
      if (connectivityResult.contains(ConnectivityResult.mobile) ||
          connectivityResult.contains(ConnectivityResult.wifi)) {
        var response = await apiManger.changePassword(oldPassword, newPassword,rePassword);
        var logInResponse = ChangePasswordResponseDm.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return right(logInResponse);
        }
        else {
          return left(ServerError(ErrorMsg: logInResponse .message!));
        }
      }
      else {
        return left(ClientError(ErrorMsg: 'please check your internet'));
      }
  }

}