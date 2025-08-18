import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerece_online_c13/core/api/api_manger.dart';
import 'package:e_commerece_online_c13/core/failers/failers.dart';
import 'package:e_commerece_online_c13/data/model/AddLocationResponseDm.dart';
import 'package:e_commerece_online_c13/data/model/ChangePasswordResponseDm.dart';
import 'package:e_commerece_online_c13/data/model/logInResponseDTO.dart';
import 'package:e_commerece_online_c13/domain/intities/logInResponseEntity.dart';
import 'package:e_commerece_online_c13/domain/repositories/data_source/logInDataSource.dart';
import 'package:injectable/injectable.dart';

import '../../domain/intities/AddLocationResponseEntity.dart';
import '../../domain/intities/ChangePasswordResponseEntity.dart';
import '../../domain/repositories/data_source/AddLocationDataSource.dart';
import '../../domain/repositories/data_source/ChangePasswordDataSource.dart';
@Injectable(as:AddLocationDataSource )
class AddLocationDataSourceImpl implements AddLocationDataSource{
  ApiManger apiManger;
  AddLocationDataSourceImpl({required this.apiManger});
  @override
  Future<Either<Failers, AddLocationResponseEntity>> AddLocation(String name,String details,String phone,String city)async {
      final List<ConnectivityResult> connectivityResult = await (Connectivity()
          .checkConnectivity());
      if (connectivityResult.contains(ConnectivityResult.mobile) ||
          connectivityResult.contains(ConnectivityResult.wifi)) {
        var response = await apiManger.addLocation(name, details, phone, city);
        var logInResponse = AddLocationResponseDm.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return right(logInResponse);
        }
        else {
          return left(ServerError(ErrorMsg: logInResponse.status!));
        }
      }
      else {
        return left(ClientError(ErrorMsg: 'please check your internet'));
      }
  }

}