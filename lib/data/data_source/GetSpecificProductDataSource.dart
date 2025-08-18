import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../core/api/api_manger.dart';
import '../../core/failers/failers.dart';
import '../../domain/repositories/data_source/GetSpecificProductDataSource.dart';
import '../model/GetSpecificProductResponseDM.dart';
import '../model/categoryRespnonseDM.dart';
@Injectable(as: GetSpecificProductDataSource)
class GetSpecificProductDataSourceImpl implements GetSpecificProductDataSource{
  ApiManger apiManger;
  GetSpecificProductDataSourceImpl({required this.apiManger});

  Future<Either<Failers, GetSpecificProductResponseDm>> GetSpecificProduct(String id)async{

    final List<ConnectivityResult> connectivityResult = await (Connectivity()
        .checkConnectivity());

   try{ if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      var response = await apiManger.getSpecificProduct(id);
      var categoryResponse=GetSpecificProductResponseDm.fromJson(response.data);
      print(response.data);
      if (response.statusCode! >= 200 && response.statusCode! < 300){return right(categoryResponse);}
      else{return left(ServerError(ErrorMsg:' Error!'));}
    }
else{return left(ClientError(ErrorMsg: 'PLEASE CHECK TOUR INTERNET'));}
  }catch(e){return Left(ClientError(ErrorMsg: e.toString()));}
  }


}