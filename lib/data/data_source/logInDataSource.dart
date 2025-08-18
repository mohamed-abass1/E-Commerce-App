import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../core/api/api_manger.dart';
import '../../core/failers/failers.dart';
import '../../domain/intities/logInResponseEntity.dart';
import '../../domain/repositories/data_source/logInDataSource.dart';
import '../model/logInResponseDTO.dart';
@Injectable(as:LogInDataSource )
class LogInDataSourceImpl implements LogInDataSource{
  ApiManger apiManger;
  LogInDataSourceImpl({required this.apiManger});
  @override
  Future<Either<Failers, LogInResponseEntity>> logIn(String email, String password)async {
    try {
      final List<ConnectivityResult> connectivityResult = await (Connectivity()
          .checkConnectivity());
      if (connectivityResult.contains(ConnectivityResult.mobile) ||
          connectivityResult.contains(ConnectivityResult.wifi)) {
        var response = await apiManger.getDataLogIN(email, password);
        var logInResponse = LogInResponseDto.fromJson(response.data);
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