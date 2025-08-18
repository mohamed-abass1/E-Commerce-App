import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../core/api/api_manger.dart';
import '../../core/failers/failers.dart';
import '../../domain/repositories/data_source/LocationDataSource.dart';
import '../model/AddLocationResponseDm.dart';
import '../model/categoryRespnonseDM.dart';
@Injectable(as:LocationDataSource )
class LocationDataSourceImpl implements LocationDataSource{
  ApiManger apiManger;
    LocationDataSourceImpl({required this.apiManger});

    Future<Either<Failers, AddLocationResponseDm>> getLocation()async{

      final List<ConnectivityResult> connectivityResult = await (Connectivity()
          .checkConnectivity());

      if (connectivityResult.contains(ConnectivityResult.mobile) ||
          connectivityResult.contains(ConnectivityResult.wifi)) {
        var response = await apiManger.getLocation();
        var categoryResponse=AddLocationResponseDm.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300){return right(categoryResponse);}
        else{return left(ServerError(ErrorMsg:response.statusMessage??''));}
      }
      else{return left(ClientError(ErrorMsg: 'PLEASE CHECK TOUR INTERNET'));}

    }

  }

