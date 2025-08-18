import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../core/api/api_manger.dart';
import '../../core/failers/failers.dart';
import '../../domain/intities/UpdateUserDataResponseEntity.dart';
import '../../domain/repositories/data_source/UpdateUserDataSource.dart';
import '../model/UpdateUserDataResponseDM.dart';
@Injectable(as:UpdateUserDataSource )
class UpdateUserDataSourceImpl implements UpdateUserDataSource{
  ApiManger apiManger;
  UpdateUserDataSourceImpl({required this.apiManger});
  @override
  Future<Either<Failers, UpdateUserDataResponseEntity>> UpdateUser(String name,String email,String phone)async {
    try {
      final List<ConnectivityResult> connectivityResult = await (Connectivity()
          .checkConnectivity());
      if (connectivityResult.contains(ConnectivityResult.mobile) ||
          connectivityResult.contains(ConnectivityResult.wifi)) {
        var response = await apiManger.getDataUpdateUser(name, email,phone);
        var logInResponse = UpdateUserDataResponseDm.fromJson(response.data);
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
    }catch(e){return left(ServerError(ErrorMsg: e.toString()));}
  }

}